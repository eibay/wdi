require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/shirt'
require_relative './lib/order'
require_relative './lib/user'
require_relative './lib/cart'
require_relative './lib/ordercontent'
require 'json'

after do
  ActiveRecord::Base.connection.close
end

get('/') do
	shirts=Shirt.all.order(id: :desc)
	cart=Cart.all()

	erb(:index, {locals:{shirts:shirts, cart: cart}})
end

get('/admin') do
	unfulfilled=Order.where(fulfilled: false)
	erb(:admin,{locals:{unfulfilled: unfulfilled}})
end

post('/addshirt') do
	order=JSON.parse(request.body.read)

	shirt=Shirt.new
	shirt.name=order["shirtName"]
	shirt.price=order["price"].to_i  
	shirt.quantity=order["quantity"].to_i
	shirt.picture=order["picture"]
	shirt.save
	puts "Shirt successfully added"
	['Shirt successfully added'].to_json

end


post('/addtocart') do

	add=JSON.parse(request.body.read)
	cart=Cart.new
	cart.shirt_id=add["shirt_id"]
	cart.quantity=add["quantity"]
	cart.save
	['Shirt successfully added'].to_json
end


post('/submitcart') do
	submit=JSON.parse(request.body.read)
	
	order=Order.new
	order.fulfilled=false;
	order.save
	this_order=Order.last

	submit["shirtsArray"].each_with_index do |shirt, index|
		ordercontents=Ordercontent.new
		ordercontents.order_id=this_order.id
		ordercontents.shirt_id=shirt
		ordercontents.quantity=submit["QuantityArray"][index]
		ordercontents.save
		shirt=Shirt.find_by(id: shirt)
		shirt.quantity= shirt.quantity - submit["QuantityArray"][index].to_i
		shirt.save
	end
	Cart.delete_all
	
	['Shirt successfully sold'].to_json

end


post('/fulfillorder') do

	order_id=JSON.parse(request.body.read)[0].to_i
	order=Order.find_by(id: order_id)
	order.fulfilled=true
	order.save
	['Order successfully Fulfilled'].to_json
end













