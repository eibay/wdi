require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative './lib/connection'
require_relative './lib/shirt'


after do
  ActiveRecord::Base.connection.close
end


get '/' do 
  list_shirts = Shirt.all().sort();



  erb(:index, {locals: {list_shirts: list_shirts}})
end

get '/admin' do

  erb(:admin)
end

post '/add_shirt' do
  hash_shirt = {name: params["name"], quantity: params["quantity"].to_i, price: params["price"].to_i, img_url: params["img_url"]}
  s = Shirt.new(hash_shirt)
  s.save

  redirect request.referrer
end

put '/buy' do
  qty_decrease = params["qty_to_buy"].to_i
  s = Shirt.find_by(id: params["id"])

  qty_new = s.quantity - qty_decrease
  s.update(quantity: qty_new)
  s.save




  redirect request.referrer
end

# http://goo.gl/IpDvog
# http://goo.gl/aFcMQW
# http://goo.gl/mgGsai