require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/customer'
require_relative './lib/order'
require_relative './lib/tshirt'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index, { locals: { tshirts: Tshirt.all() } })
end

post("/admin/newshirt") do
	tshirt_hash = {
		image: params['image'],
		name: params['name'],
		price: params['price'],
		quantity: params['quantity']
	}

	Tshirt.create(tshirt_hash)

	erb(:admin, { locals: { tshirts: Tshirt.all() } })
end