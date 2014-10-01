require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require_relative './lib/connection'
require_relative './lib/grocery'

after do
	ActiveRecord::Base.connection.close
end

get('/') do
	erb(:index)
end

post('/add') do
	content_type :json
	item=params["item"]
	quantity=params["quantity"].to_i
	grocery_length=Grocery.all.length
	grocery=Grocery.new
	grocery.item=item
	grocery.position=grocery_length
	grocery.bought=false
	grocery.quantity=quantity
	grocery.save
	item=Grocery.last
	item.to_json
end

get('/groceries') do
	content_type :json
	groceries_need=Grocery.where(bought: false).order(position: :asc)
	groceries_have=Grocery.where(bought: true).order(position: :asc)
	response={need: groceries_need, have: groceries_have}

	response.to_json
end

delete('/deleteitem') do
	content_type :json
	id=params["id"]
	delete=Grocery.find_by(id: id)
	delete.destroy
	{response: 'deleted'}.to_json
end

put('/updateposition')do
	content_type :json
	id=params["id"]
	position=params["position"].to_i
	update=Grocery.find_by(id: id)
	update.quantity=params["quantity"].to_i
	update.position=position
	update.bought=params["bought"]
	update.save
	update.to_json
end

put('/updatequantity') do
	content_type :json
	id=params["id"].to_i
	item=Grocery.find_by(id: id)
	item.quantity=item.quantity+1
	item.save

	item.to_json
end

put('/lowerquantity') do
	content_type :json
	id=params["id"].to_i
	item=Grocery.find_by(id: id)
	item.quantity=item.quantity-1
	item.save
	this.to_json
end










