require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'
require_relative './lib/car'

get("/") do
  erb(:index)
end

post("/mechanics") do
  mechanic = {"name" => params["name"], "age" => params["age"], "favorite_car" => params["favorite_car"]}

  Mechanic.create(mechanic)

  erb(:mechanics, {locals: {mechanics: Mechanic.all() }})

end

get("/mechanics") do
  erb(:mechanics, { locals: {mechanics: Mechanic.all() }})
end

get("/mechanics/new") do
  erb(:new_mechanic_pg)
end

get("/mechanics/:name") do
  mechanic = Mechanic.find_by("name", params[:name])

  erb(:mechanic, {locals: {mechanic: mechanic }})
end

# get("/mechanics/search") do

# end

get("/cars/new") do
  erb(:new_car_pg)
end

get("/cars/:make") do
  car = Car.find_by("make", params[:make])

  erb(:car, {locals: {car: car  }} )
end

post("/cars") do
  car = { make: params["make"], model: params["model"], color: params["color"]}

  Car.create(car)

  erb(:cars, {locals: { cars: Car.all() }})
end

get("/cars") do
  erb(:cars, {locals: {cars: Car.all() }})
end





