require 'sinatra'
require 'pry'
require 'active_record'
require_relative 'lib/shirt.rb'
require_relative 'lib/connection.rb'


after do
  ActiveRecord::Base.connection.close
end

get ('/') do 
	shirts = Shirt.all()
	erb(:index, {locals: {shirts: shirts} })
end

get ('/admin') do
	shirts= Shirt.all()
	erb(:admin, {locals: {shirts: shirts} })
end

post ('/add') do
	name = params["name"]
	imageurl = params["imageurl"]
	price = params["price"]
	quanity = 10

	Shirt.create({name: name, imageurl: imageurl, price: price, quanity: quantity})

	redirect('/admin')

end

delete('/delete') do
	tshirt = params["id"]
	specific_shirt = Shirt.find_by(id: tshirt)
	specific_shirt.destroy
	redirect('/admin')
end

post('/add_to_order') do
	binding.pry
end


