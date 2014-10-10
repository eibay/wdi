require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/connection'
require_relative './lib/item'
require 'JSON'

after do 
	ActiveRecord::Base.connection.close
end

get ("/") do 
	erb(:index)
end

post ("/newItem") do 
	content_type :json
	item = Item.create(name: params["name"])
	item.to_json
end

get ("/getItem") do 
	return Item.all().to_json
end

delete ("/:id") do 
	item = Item.find_by(id: params["id"])
	item.delete
end