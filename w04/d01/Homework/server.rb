require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/car'
require_relative './lib/mechanic'

get("/") do 
	mechanics = Mechanic.all()
	cars = Car.all()

	erb(:index, {locals: {mechanics: mechanics, cars: cars } } )
end

post("/mechanics") do
	car_name = params["name"]
	car_age = params["age"]
	favorite_car = params["favorite_car"]

	mechanic = {"name" => car_name, "age" => car_age, "favorite_car" => favorite_car}
	Mechanic.create(mechanic)

	erb(:mechanics, {locals: {mechanics: Mechanic.all() } } )
end

get("/mechanics") do
	erb(:mechanics, {locals:{ mechanics: Mechanic.all()}})
end

get("/mechanics/new") do
	erb(:new_mechanics)
end

get("/mechanics/:car_name") do
	mechanic = Mechanic.find_by("name", params[:car_name])
	# mechanic2 = Mechanic.find_by("favorite_car", params[:favorite_car])

	erb(:mechanic, {locals: {mechanic: mechanic, mechanic2: mechanic2} } )
end


get("/cars/new") do
	erb(:new_cars)
end

get("/cars/:car_name") do
	car = Car.find_by("make", params[:car_make])
	# car = Car.find_by("model", params[:car_model])

erb(:car, {locals: { car: car, car2: car2 } } )
end

post("/cars") do
	car_make = params["make"]
	car_model = params["model"]
	car_color = params["color"]

	car = {"make" => car_make, "model" => car_model, "color" => car_color}

	Car.create(car_name)

	erb(:cars, {locals: {cars: Car.all() } } )
end

get("/cars") do
	erb(:cars, {locals: { cars: Car.all() } })

end




