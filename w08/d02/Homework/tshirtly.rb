require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative './lib/connection'
require_relative './lib/shirt'
require_relative './lib/order'


after do
  ActiveRecord::Base.connection.close
end


get '/' do 
  list_shirts = Shirt.all.sort

  erb(:index, {locals: {list_shirts: list_shirts}})
end

get '/admin' do
  list_orders = Order.all.sort
  list_shirts = Shirt.all.sort

  erb(:admin, {locals: {list_shirts: list_shirts, list_orders: list_orders}})
end

post '/add_shirt' do
  s = Shirt.new({name: params["name"], quantity: params["quantity"].to_i, price: params["price"].to_i, img_url: params["img_url"]})
  s.save

  redirect request.referrer
end

post '/make_order' do
  o = Order.new({email: params["email"], order_amount: params["order_amount"].to_i, shirt_id: params["id"].to_i})
  o.save

  redirect request.referrer
end

put '/send_order' do

  s = Shirt.find_by({id: params["shirt_id"].to_i})
  qty_to_decrease = params["order_amount"].to_i
  qty_new = s.quantity - qty_to_decrease

  s.update({quantity: qty_new})

  o = Order.find_by({id: params["order_id"].to_i})
  o.destroy

  redirect request.referrer
end

# http://goo.gl/IpDvog
# http://goo.gl/aFcMQW
# http://goo.gl/mgGsai