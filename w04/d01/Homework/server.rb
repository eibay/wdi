require 'sinatra'
require "pry"
require_relative ('./lib/methods')

get ("/") do 
	erb(:index, {locals: { car: Car.all(), mechanic: Mechanic.all() }})
end 

post ("/mechanic") do 
	new_mechanic = {name: params["name"], age: params["age"], fav_car: params["favorite_car"]}
	Mechanic.create(new_mechanic)
	car = ""
	erb(:mechanic, {locals: { mechanic: Mechanic.all()}})
end 

post ("/car") do 
	new_car = {make: params["make"], model: params["model"], color: ["color"]}
	Car.create(new_car)
	mechanic = ""
	erb(:car, {locals: { car: Car.all()}})
end


get ("/mechanic") do 
	erb(:mechanic, {locals: { mechanic: Mechanic.all()}})
end

get ("/car") do 
	erb(:car, {locals: { car: Car.all()}})
end

get("/search") do 
 	erb(:search)
end

get ("search/mechanic_car/:car") do 
	car = Mechanic.find_by("fav_car", params[:car])
	name= ""
	erb(:search_mechanic, { locals: { car: car, name: name }})
end

get ("/search/mechanic_name/:name") do 
	name = Mechanic.find_by("name", params[:name])
	car = ""
	erb(:search_mechanic, { locals: { car: car, name: name }})
end

get ("search/car_model/:model") do 
	model= Car.find_by("model", params[:model])
	make =""
	erb(:search_car, { locals: { model: model, make: make }})
end 

get ("/search/car_make/:make") do 
	make= Car.find_by("make", params[:make])
	model= ""
	binding.pry
	erb(:search_car, { locals: { model: model, make: make }})
end





