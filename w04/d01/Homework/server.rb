require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/mechanics'
require_relative './lib/cars'


get("/") do
	erb(:index)
end

get("/mechanics") do
	mechanics = Mechanic.all()	
	erb(:mechanics, {locals: {mechanics: mechanics} })
end

get("/mechanic/new") do
	erb(:new_mech)
end

get("/mechanics/search") do 
	erb(:mech_search)
end

get("/mechanic") do
	mechanic = Mechanic.find_by("name", params[:search]) || Mechanic.find_by("fave_car", params[:search])
	erb(:mechanic_info, { locals: {mechanic: mechanic} })
end

post("/mechanic") do
	mechanic = {name: params[:name], age: params[:age], fave_car: params[:fave_car] }
	Mechanic.create(mechanic)
	redirect("/mechanics")
end

get("/mechanic/info/:name") do
	mechanic = Mechanic.find_by("name", params[:captures][0])
	erb(:mechanic_info, {locals: { mechanic: mechanic } })
end

post("/mechanics/auto") do 
	5.times do |mechanic|
		Mechanic.auto()
	end	
	redirect("/mechanics")
end

get("/cars") do
	cars = Car.all()
	erb(:cars, {locals: {cars: cars} })
end

get("/car/new") do
	erb(:new_car)
end

get("/cars/search") do
	erb(:car_search)
end

get("/car") do
	cars = Car.find_by("make", params[:search]) || Car.find_by("model", params[:search])
	erb(:car, {locals: {cars: cars} })
end

post("/car") do
	car = {make: params[:make], model: params[:model], color: params[:color]}
	Car.create(car)
	redirect("/cars")
end




