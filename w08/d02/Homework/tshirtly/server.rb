require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './db/connection.rb'
require_relative './lib/tshirt.rb'
require_relative './lib/order.rb'
require 'pry'

get "/" do

  erb(:index, locals:{shirts: Tshirt.all()})
end

get "/admin" do

  erb(:admin, locals:{shirts: Tshirt.all()})
end

post "/admin" do
  teetype = params["teetype"]
  image = params["image"]
  quantity = params["quantity"]
  price = params["price"]

  new_t = {teetype: teetype, image: image, quantity: quantity, price: price}

  Tshirt.create(new_t)
  erb(:admin, locals:{shirts: Tshirt.all()})
end

delete "/admin" do
  id_of_shirt_to_delete = params['deleted_shirt']
  del_shirt = Tshirt.find(id_of_shirt_to_delete)
  Tshirt.destroy(del_shirt)

  erb(:admin, locals:{shirts: Tshirt.all()})
end
