require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/shuttles'
require_relative './lib/astronaut'


get("/") do 
	erb(:index)	
end

post('/shuttles') do
	shuttle = {"name" => params["name"], "origin_country" => params["origin"], "destination" => params["destination"]}
	Shuttle.create(shuttle)

	erb(:shuttles, {locals: { shuttles: Shuttle.all()} })
end

get('/shuttles') do 
	erb(:shuttles, {locals: { shuttles: Shuttle.all()} })
end

get('/shuttles/add') do 
	erb(:add_shuttle, {locals: { shuttles: Shuttle.all()} })
end

get('/shuttle/:id') do 
	shuttle = Shuttle.find_by("id", params["id"])
	astronaut = Astronaut.select_by("shuttle_id", shuttle["id"])
	
	erb(:shuttle, {locals: { shuttle: shuttle, astronaut: astronaut}})
end

###############################################################

post('/astronauts') do
	astronaut = {"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}
	Astronaut.create(astronaut)

	erb(:astronauts, {locals: { astronauts: Astronaut.all()} })
end

get('/astronauts') do
	erb(:astronauts, {locals: { astronauts: Astronaut.all()} })
end

get('/astronauts/add') do
	erb(:add_astronaut, {locals: { shuttles: Shuttle.all()} })
end

get('/astronaut/:id') do 
	astronaut = Astronaut.find_by("id", params["id"])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:astronaut, {locals: { astronaut: astronaut, shuttle: shuttle} })

end