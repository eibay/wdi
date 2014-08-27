require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronauts'
require_relative './lib/shuttles'

get('/') do 
	erb(:main)
end

post('/astronauts') do
	astronaut = {"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}
	astronauts = Astronaut.all()
	Astronaut.create(astronaut)

	erb(:astronauts, {locals: { astronauts: astronauts}})
end

get('/astronauts') do
	astronauts = Astronaut.all()
	erb(:astronauts, {locals: { astronauts: astronauts}})
end

get('/astronauts/add') do
	shuttles = Shuttle.all()
	erb(:astronaut_add, {locals: { shuttles: shuttles}})
end

get('/astronaut/:id') do 
	astronaut = Astronaut.find_by("id", params["id"])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:astronaut, {locals: { astronaut: astronaut, shuttle: shuttle}})
end

# Shuttles

post('/shuttles') do
	shuttles = Shuttle.all()
	shuttle = {"name" => params["name"], "origin_country" => params["origin"], "destination" => params["destination"]}
	Shuttle.create(shuttle)

	erb(:shuttles, {locals: { shuttles: shuttles}})
end

get('/shuttles') do 
	shuttles = Shuttle.all()
	erb(:shuttles, {locals: { shuttles: shuttles}})
end

get('/shuttles/add') do 
	shuttles  =Shuttle.all()
	erb(:shuttle_add, {locals: { shuttles: shuttles}})
end

get('/shuttle/:id') do 
	shuttle = Shuttle.find_by("id", params["id"])
	astronauts = Astronaut.select_by("shuttle_id", shuttle["id"])
	erb(:shuttle, {locals: { shuttle: shuttle, astronauts: astronauts}})
end








