require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/cars'
require_relative './lib/mechanics'

get("/") do  
	erb(:index)
end

get("/cars") do
	cars = Car.all()
	erb(:cars, { locals: { cars: cars } })
end

get("/car") do
	erb(:car)
end

get("/car_new") do
	erb(:car_new)
end

post("/cars") do
	make = params["make"]
	model = params["model"]
	color = params["color"]
	car = {"make" => make, "model" => model, "color" => color}

	Car.create(car)

	erb(:cars, { locals: { cars: Car.all() } })
end

get("/mechanics") do
	mechanics = Mechanic.all()
	erb(:mechanics, { locals: { mechanics: mechanics } })
end

get("/mechanic") do
	erb(:mechanic)
end

get("/mechanic_new") do
	erb(:mechanic_new)
end

post("/mechanics") do
	name = params["name"]
	age = params["age"]
	fave = params["fave"]
	mechanic = {"name" => name, "age" => age, "fave" => fave}

	Mechanic.create(mechanic)

	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/search_car") do
	make_search = params["make_search"]
	model_search = params["model_search"]

	erb(:search_car, { locals: { cars: Car.all(), make_search: make_search, model_search: model_search } })
end

get("/search_mechanic") do
	erb(:search_mechanic, { locals: { mechanics: Mechanic.all() } })
end

