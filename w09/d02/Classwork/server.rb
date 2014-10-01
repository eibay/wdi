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

post '/add' do

	Item.create(params)

	items = Item.all()
	
	items.to_json

end

delete '/delete' do
	item = Item.find_by(name: params[:name])

	item.destroy
	
end