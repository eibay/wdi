require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/tshirt'
require_relative './lib/user'
require_relative './lib/order'

after do 
	ActiveRecord::Base.connection.close
end

get('/') do
	tshirts = Tshirt.all()
	erb(:index, {locals: {tshirts: tshirts}})
end

get('/admin') do 
	erb(:admin)
end

post('/add-shirt') do
	params = JSON.parse(request.body.read)
	Tshirt.create(params)
end	

post('/add-order') do
	params = JSON.parse(request.body.read)
	Order.create(params)
end