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
	items = Item.all()
	items.to_json
end

post('/item') do
	content_type 'json'
	item = []
	item << Item.create({item: request.body.read})
	item.to_json
end

delete('/item') do
	item = Item.find_by(id: params[:item])
	item.destroy()
end