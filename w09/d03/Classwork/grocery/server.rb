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
	File.open('./views/index.erb')
end

post('/items') do
	attributes=JSON.parse(request.body.read)
	content_type :json
	item=attributes["item"]
	quantity=attributes["quantity"].to_i
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

get('/items') do
	content_type :json
	groceries_need=Grocery.where(bought: false).order(position: :asc)
	groceries_have=Grocery.where(bought: true).order(position: :asc)
	response=Grocery.all.order(position: :asc)

	response.to_json
end

delete('/items/:id') do
	content_type :json
	id=params["id"]
	delete=Grocery.find_by(id: id)
	delete.destroy
	{response: 'deleted'}.to_json
end

put('/items/:id') do
	content_type :json
	attributes=JSON.parse(request.body.read)
	id=params["id"].to_i
	item=Grocery.find_by(id: id)
	item.quantity=attributes["quantity"]
	item.bought=attributes["bought"]
	item.position=attributes["position"]
	item.save
end











