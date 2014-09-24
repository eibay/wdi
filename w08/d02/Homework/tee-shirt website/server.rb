require "sinatra"
require "sinatra/reloader"
require_relative './libs/connection'
require_relative './libs/methods'
require "pry"

after do 
  ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index, {locals: { shirt: Shirt.all() }} )
end

get("/admin")do
	erb(:admin, locals: { shirt: Shirt.all() })
end


post("/add")do
	name = params["name"] 
	image = params["image"]
	price = params["price"]
	Shirt.create({name: name, image: image, price: price})
 redirect "/admin"
end 

delete("/delete") do
	id = params["tshirt"]
	tshirt= Shirt.find_by(id: id)
	tshirt.destroy
	redirect "/admin"
end 

post ("/add_to_order")do 
binding.pry

end 