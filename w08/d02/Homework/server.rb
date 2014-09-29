require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './connection'
require_relative './models/shirt'
require_relative './models/user'

after do
  ActiveRecord::Base.connection.close
end


get '/' do
	
	shirts = Shirt.all

	erb(:index, {locals: {shirts: shirts}})

end

get '/styles.css' do

content_type :css

File.read('./styles.css')

end

get '/javascript.js' do

content_type :js
File.read('./javascript.js')

end

get '/admin' do

pending = User.where(pending: true)
soldOut = Shirt.where(quantity: 0)
overSold = Shirt.where(oversold: true)
allShirts= Shirt.all

erb(:admin, {locals: {pending: pending, soldOut: soldOut, overSold: overSold, shirts: allShirts}})

end

post '/admin/add' do

	price = params['price']
	image = params['url']
	quantity = params['quantity']

	Shirt.create({
		image: image,
		quantity: quantity,
		price: price, 
		oversold: false
		})

redirect '/admin'

end


post '/buy/:id/:quantity/:email' do

email = params["email"]
quantity=params["quantity"]
id = params["id"]

User.create({
	email: email,
	shirtid: id,
	quantity: quantity,
	pending: true
	})

end


post '/admin/complete-order/:id' do

	user_id = params["id"]
	user=User.find_by(id: user_id)
	shirt_id = user.shirtid
	requested_quantity= user.quantity

	shirt = Shirt.find_by(id: shirt_id)
	shirts_inStock= shirt.quantity
	quantity_left = shirts_inStock - requested_quantity
		
		if quantity_left < 0
			oversold = true
		else
			oversold = false
		end

	shirt.update(quantity: quantity_left, oversold: oversold)
	user.update(pending: false)

	redirect '/admin'

end

post '/admin/remove-shirt/:id' do

shirt_id= params["id"]
shirt= Shirt.find_by(id: shirt_id)
shirt.destroy

redirect '/admin'

end
















