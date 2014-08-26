require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'
require_relative './lib/car'

get("/") do

erb(:index)
end

get("/register") do 
	mechanics = Mechanic.all()

	erb(:register, { locals: { mechanics: mechanics } })
	
end

get("/mechanics") do

erb(:mechanics, { locals: { mechanics: Mechanic.all() } })

end

post("/mechanics") do
	mechanics = Mechanic.all()
	name = params["name"]
	age = params["age"]
	favorite_car = params["favorite_car"]

	mechanic = {"name" => name, "age" => age, "favorite_car" => favorite_car}

	Mechanic.create(mechanic)

	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/search") do
	
	erb(:search)
end

post("/search") do
	mechanics = Mechanic.all()
	name = params["name"]

	erb(:search_results, { locals: { mechanics: Mechanic.all(), name: name } })

end

get("/register_car") do 
	cars = Car.all()

	erb(:register_car, { locals: { cars: cars } })
	
end

get("/cars") do

erb(:cars, { locals: { cars: Car.all() } })

end

post("/cars") do
	cars = Car.all()
	make = params["make"]
	model = params["model"]
	color = params["color"]

	car = {"make" => make, "model" => model, "color" => color}

	Car.create(car)

	erb(:cars, { locals: { cars: Car.all(), make: make, model: model } })
end

get("/search_cars") do
	
	erb(:search_cars)
end

post("/search_cars") do
	cars = Car.all()
	make = params["make"]
	model = params["model"]

	erb(:search_results_car, { locals: { cars: Car.all(), make: make, model: model } })

end
