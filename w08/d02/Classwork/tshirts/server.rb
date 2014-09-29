require 'sinatra'
require 'pry'
require 'sinatra/reloader'

require_relative './lib/connection.rb'
require_relative './lib/shirt.rb'
require_relative './lib/sale.rb'

after do
  ActiveRecord::Base.connection.close
end

get "/" do
  erb(:index,{locals:{shirts: Shirt.all}}) 
end


post "/tshirt/:id/:number/:email" do
  id = params[:id].to_i
  number = params[:number].to_i
  email = params[:email]
  newsale = {quanity: number, tshirt_id: id, email: email, pending: true}
  Sale.create(newsale)
  tshirt = Shirt.find_by({id:id})
end


get "/admin" do
 erb(:admin,{locals:{shirts: Shirt.all}}) 
  end

  get "/tshirt/:id" do
    shirt = Shirt.find_by({id: params[:id]})
    sales = Sale.where({tshirt_id: params[:id], pending:true})
    erb(:tshirt,{locals:{sales: sales, shirt:shirt}}) 
  end


put "/fulfill/:id" do
  sale = Sale.find_by({id: params[:id]})
  shirt = Shirt.find_by({id: sale.tshirt_id})
  sales = Sale.where({tshirt_id: sale.tshirt_id, pending:true})
  newquanity = shirt.quanity - sale.quanity
  newsale = {quanity: sale.quanity, tshirt_id: sale.tshirt_id, email: sale.email, pending: false}
  sale.update(newsale)
  newshirt = {name: shirt.name, url: shirt.url, price: shirt.price, quanity: newquanity}
  shirt.update(newshirt)
 erb(:tshirt,{locals:{shirt: shirt, sales: sales}}) 
end

delete "/delete/:id" do
  shirt = Shirt.find_by({id: params[:id]})
  shirt.destroy
  redirect "/admin"
end


get "/add" do
  erb(:add)
end


post "/add/shirt" do
  name = params[:name].downcase
  url = params[:url]
  quanity = params[:quanity]
  price = params[:price].to_i
   newshirt = {name: name, url: url, quanity: quanity, price: price}
   Shirt.create(newshirt)
  erb(:admin,{locals:{shirts: Shirt.all}}) 
 end





