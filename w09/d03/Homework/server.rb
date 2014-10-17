require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'
require 'active_record'
require_relative './lib/item'
require_relative './lib/connection'

after do
	ActiveRecord::Base.connection.close
end

get '/' do

	erb(:index)
end

get '/ajax' do
 
	items = Item.all()
	items.to_json

end

post '/items' do

	attributes = JSON.parse(request.body.read)
	name = attributes["name"]
	quantity = attributes["quantity"]
	newItem = {name: name, quantity: quantity}

	item = Item.create(newItem)
	item.to_json
	# Item.create(params)
	# binding.pry
	# items = Item.all()
	# id = items.last.id
	# id.to_json
end

delete '/items/:id' do
	item = Item.find_by(id: params[:id])

	item.destroy

end

put '/update' do
	binding.pry
	item = Item.find_by(id: params[:id])
	updated_item = {name: item.name, quantity: params[:quantity]}
	item.update(updated_item)
end