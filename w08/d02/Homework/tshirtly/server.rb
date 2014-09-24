require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/tshirt'
require_relative './lib/order'

after do 
	ActiveRecord::Base.connection.close
end

get ("/") do
	erb(:index, { locals: { tshirts: Tshirt.all() } })
end

get ("/admin") do
	erb(:admin, { locals: { tshirts: Tshirt.all(), orders: Order.all() } })
end

post ("/admin") do
		tshirts_hash = {
		name: params["name"],
		quantity: params["quantity"],
		price: params["price"],
		image_url: params["image_url"]
	}

	all_tshirts = Tshirt.create(tshirts_hash)
	all_tshirts.save

	erb(:admin, { locals: { tshirts: Tshirt.all(), orders: Order.all() } })
end 

get ("/tshirts/:id") do
		tshirt = Tshirt.find_by({id: params[:id]})
	erb(:tshirt, { locals: { tshirt: tshirt, tshirts: Tshirt.all() } })
end

post ("/confirmation") do

	orders_hash = {
		tshirt_id: params["tshirt_id"],
		quantity: params["quantity"],
		email_address: params["email"]
	}

	order = Order.find_by({id: params[:id]})
	all_orders = Order.create(orders_hash)
	all_orders.save

		erb(:order, { locals: { order: order, orders: Order.all() } })
end

get("/tshirts/:id/edit") do
	tshirt = Tshirt.find_by({id: params[:id]})

	erb(:"edit", { locals: { tshirt: tshirt, tshirts: Tshirt.all() } })
end

put("/tshirts/:id") do
		tshirts_hash = {
		name: params["name"],
		quantity: params["quantity"],
		price: params["price"],
		image_url: params["image_url"]
	}

	tshirt = Tshirt.find_by({id: params[:id]})
	tshirt.update(tshirts_hash)

	erb(:admin, { locals: { tshirt: tshirt, tshirts: Tshirt.all(), orders: Order.all() } })
end

delete ("/tshirts/:id") do
	tshirt = Tshirt.find_by({id: params[:id]})
	tshirt.destroy

	redirect "/admin"
end

delete ("/orders/:id") do
	order = Order.find_by({id: params[:id]})
	order.destroy

	redirect "/admin"
end