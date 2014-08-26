require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic.rb'

get "/" do
	@title = "Mechanics Directory"
	@mechanics = JSON.parse(File.read("./mechanics.txt"))
	erb :index
end

post ("/mechanics") do
	mechanics = {"name" => params["name"], "age" => params["age"], "favorite_car" => params["favorite_car"]}
	Mechanic.create(mechanics)
	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanics") do
	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanics/new") do
	erb(:new_mechanic)
end

get("/mechanics/:name") do
	mechanic = Mechanic.find_by("name", params[:name])
	erb(:mechanic, { locals: { mechanic: mechanic } })
end

get("/") do
  erb(:index)
end

post ("/cars") do
	cars = {"make" => params["make"], "model" => params["model"], "color" => params["color"]}
	Car.create(car)
	erb(:cars, { locals: { cars: Car.all() } })
end

get("/cars") do
	erb(:Cars, { locals: { cars: Car.all() } })
end

get("/cars/new") do
	erb(:new_car)
end

get("/cars/:name") do
	car = Car.find_by("make", params[:make] || "model", params[:model])
	erb(:car, { locals: { car: car } })
end


