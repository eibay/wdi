require_relative './lib/connection.rb'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


after do 
	ActiveRecord::Base.connection.close
end

get '/' do 
	shirts = Shirt.all()
	erb(:main, {locals: { shirts: shirts}})
end

get '/admin' do
	erb(:admin)
end

post '/add_shirt' do 
	binding.pry
	new_shirt = {
		name: params['name'],
		price: params['price'],
		quantity: params['quantity'],
		image: params['image']
	}
	Shirt.create(new_shirt)
	redirect request.referrer
end

put '/orders' do 

	binding.pry
	order_quant = params['quantity'].to_i

	shirt = Shirt.find_by(id: params['id'])
	new_quant = shirt.quantity - order_quant
	shirt.quantity = new_quant
	shirt.save

	redirect request.referrer
end







