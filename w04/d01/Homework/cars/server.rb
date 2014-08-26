require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/'
require_relative './lib/'

get("/") do
  cars = Mechanics.all()
  erb(:index, { locals: { cars: cars} })
end

post ("/mechanics") do
	cars = {"name" = params["name"], "age" = params["age"], "favorite_car" = params["favorite_car"])
	Mechanic.create(mechanic)
	erb(:mechanics, locals: { mechanics: Mechanics.all() } })
end

get("/mechanics") do
	erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanics/new") do
	erb(:new_mechanic)
end

get("/mechanics/:name") do
	mechanic = Mechanic.find_by("name", params[:name])
	erb (:mechanic, { locals: { mechanic: mechanic } })
end
