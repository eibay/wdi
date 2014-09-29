require 'sinatra'
require 'active_record'
require 'json'
require 'httparty'
require 'pry'
require_relative './lib/tshirt'
require_relative './lib/user'
require_relative './lib/connection'

after do
	ActiveRecord::Base.connection.close
end

get('/') do

	erb(:index, { locals: { tshirts: Tshirt.all() }})
end

post('/') do

	tshirt = {name: params["name"], price: params["price"], image: params["image"], quantity: params["quantity"]}
	Tshirt.create(tshirt)

	erb(:index, { locals: { tshirts: Tshirt.all() }})
end

get('/tshirt/:id') do

	tshirt = Tshirt.find_by(id: params["id"])
	erb(:buy, { locals: { tshirt: tshirt }})
end

post('/confirmation/:id') do
	user = {
		tshirt_id: params["id"],
		quantity: params["quantity"],
		email: params["email"]
	}

	User.create(user)

	erb(:confirmation)
end

get('/admin') do
	tshirts = Tshirt.all()
	soldout = []

	tshirts.each do |tshirt|
		if tshirt.quantity.to_i == 0
			soldout << tshirt
		end
	end

	erb(:admin, { locals: { users: User.all(), soldouts: soldout }})
end

post('/ship/:id') do

	tshirt = Tshirt.find_by(id: User.find_by(id: params["id"])["tshirt_id"])
	tshirt.quantity = tshirt.quantity - User.find_by(id: params["id"])["quantity"].to_i
	tshirt.save

	user = User.find_by(id: params["id"])
	user.destroy

	redirect "/admin"
end

delete('/user/:id/remove') do
	user = Tshirt.find_by(id: params["id"])
	user.destroy

	redirect "/admin"
end






