require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection.rb'
require_relative './lib/customer.rb'
require_relative './lib/purchase.rb'
require_relative './lib/shirt.rb'

get ("/") do 
	erb(:index, locals: {shirts: Shirt.all()})
end

post ("/purchase/:id") do
	if Customer.find_by(email: params["email"]) ==nil
		Customer.create(email: params["email"])
	end
	cust = Customer.find_by(email: params["email"])
	total_cost = (Shirt.find_by(id: params["id"]))["price"] * params["quantity"].to_i

	new_purchase = {
		customer_id: cust.id,
		shirt_id: params["id"],
		quantity: params["quantity"],
		cost: total_cost,
		filled: false
	}
	Purchase.create(new_purchase)
	recent_purchase = Purchase.last
	erb(:confirm, locals: {purchase: recent_purchase})
end

get ("/admin") do
	erb(:admin, locals: {shirts: Shirt.all(), purchases: Purchase.all()})
end