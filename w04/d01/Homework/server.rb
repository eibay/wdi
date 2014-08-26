require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'
require_relative './lib/cars'


get("/") do
	erb(:index, {locals: { cars: Car.all() } })
end

post("/mechanic") do
	mechanic = {"first_name" => params["first_name"], "last_name" => params["last_name"], "age" => params["age"], "favorite_car" => params["favorite_car"]}

	Mechanic.create(mechanic)
	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanic") do
	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanic/add") do
	erb(:mechanic)
end

get("/mechanic/:favorite_car") do
	mechanic = Mechanic.find_by("favorite_car", params[:favorite_car])
	erb(:mechanic_cars, { locals: { mechanic: mechanic } })
end


get("/cars") do
	erb(:cars, { locals: { cars: Car.all() } })
end

post("/cars") do
	car = {"make" => params["make"], "model" => params["model"], "color" => params["color"]}

	Car.create(car)
	erb(:cars, { locals: { cars: Car.all() } })
end

get("/cars/add") do
	erb(:new_cars)
end

get("/car_search") do	 
	data = params["data"]
	cars = Car.all()

	if data == "make"
		car = Car.find_by("make", params[:data] )
	elsif data == "model"
		car = Car.find_by("model", params[:data] )
	end
	erb(:car_search, {locals: { cars: Car.all() } })
end	




