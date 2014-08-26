require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'


get("/") do  
	erb(:index)
end

post("/mechanics") do
  mechanic = {"first" => params["first"], "last" => params["last"], "age" => params["age"], "favorite_car" => params["favorite_car"]}

  Mechanic.create(mechanic)

  erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanics") do
  erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
end

get("/mechanics/new") do
	erb(:new_mechanic)
end

get("/mechanics/:first_name") do 
  mechanic = Mechanic.find_by("first", params[:first_name])

  erb(:mechanic, { locals: { mechanic: mechanic } })
end