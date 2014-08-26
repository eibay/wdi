require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'
require_relative './lib/car'

get("/") do 
	erb(:index, {locals: {mechanics: Mechanics.all(), cars:Cars.all() }})
end

post("/mechanics") do
	mechanic = {"name" => params["name"], "age" => params["age"], "favorite_car" => params["favorite_car"]}

	Mechanic.create(mechanic)

	erb(:mechanics, { locals: { mechanics: Mechanic.all() }})
end

get("/mechanics") do
	erb(:mechanics, { locals: { mechanics: Mechanics.all() }})
end

get("/mechanics/new") do
	erb(:new_mechanic)
end

get("mechanics/:name, :favorite_car") do
	mechanic = Mechanic.find_by("name", params[:name], "favorite_car", params["favorite_car"])

	erb(:mechanic, {locals: { student: student } })
end

get("/cars/new") do
	erb(:new_car)
end


get("/cars/:make") do
	car = Car.find_by("make", params[:name])

	erb(:car, { locals: { dorm: dorm } })
end

post("/cars") do
end

get("/cars") do
	erb(:cars, { locals: {cars: cars.all() } })
end