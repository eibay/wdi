require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/tshirt'
require_relative './lib/user'
require_relative './lib/order'

get('/') do
	erb(:index)
end

get('/admin') do 
	erb(:admin)
end

post('/add-shirt') do
	binding.pry
	params = JSON.parse(request.body.read)
	tshirt.create(params)
end	
