require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/tshirt'
require_relative './lib/user'
require 'pry'

after do

ActiveRecord::Base.connection.close

end

get('/') do
	erb(:index, { locals: { tshirts:Tshirt.all() } })
end

post('/') do
	tshirt_hash = {
		name: params["name"],
		image: params["image"],
		quantity: params["quantity"],
		price: params["price"]	
	}

	Tshirt.create(tshirt_hash)

	erb(:index, { locals: { tshirts: Tshirt.all() } })
end

get("/buy/:id")do
	tshirt = Tshirt.find_by(id: params["id"])

	erb(:buy, { locals: { tshirt: tshirt } })
end

# post("/tshirt/:id") do
# 	tshirt = Tshirt.find_by(id: params["id"])


# 	erb(:buy, { locals: { tshirt: tshirt } })
# end

post('/confirmation/:id') do
	user_hash = {
		tshirt_id: params["id"],
		quantity: params["quantity"],
		email: params["email"]
	}

	tshirt = Tshirt.find_by(id: params["id"])
	tshirt.quantity = tshirt.quantity - params["quantity"].to_i
	tshirt.save

	User.create(user_hash)

	erb(:confirmation)
end

get('/admin') do
	erb(:admin, { locals: { users: User.all() } })
end

delete('/user/:id/remove') do
user = Tshirt.find_by(id: params["id"])
user.destroy

redirect "/admin"
end