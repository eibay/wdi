require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require_relative './lib/connection'
require_relative './lib/item'

after do 
	ActiveRecord::Base.connection.close
end

get('/') do
	File.open('./index.html')
end

get('/list') do
	content_type 'json'
	items = Item.all().order(id: :asc)
	items.to_json
end

post('/items') do
	content_type 'json'
	attributes = JSON.parse(request.body.read)
	item = []
	item << Item.create({item: attributes["item"], quantity: attributes["quantity"]})
	item.to_json
end

put('/items/:id') do
	content_type 'json'
	attributes = JSON.parse(request.body.read)
	item = Item.find_by(id: params[:id])
	item.update({item: attributes["item"], quantity: attributes["quantity"], checked: attributes["checked"]})
end

delete('/items/:id') do
	item = Item.find_by(id: params[:id])
	item.destroy()
end