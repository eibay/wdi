require 'json'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/shuttles.rb'
require_relative './lib/astronauts.rb'

get('/') do
	erb(:index, {locals: {shuttles: Shuttle.all() }})
end

post('/astronauts') do
	astronaut = {"name" => params["astronaut_name"], "rank" => params["astronaut_rank"], "shuttle_id" => params["shuttle_id"]}
	Astronaut.create(astronaut)

	erb(:astronauts, { locals: {astronauts: Astronaut.all()} })
end

get('/astronauts') do
	erb(:astronauts, { locals: {astronauts: Astronaut.all()} })
end

get('/astronauts/:astronaut_id') do
	astronaut = Astronaut.find_by("astronaut_id", params["astronaut_id"])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:astronaut, { locals: {astronaut: astronaut, shuttle: shuttle } })
end

post('/shuttles') do
	shuttle = {"name" => params["name"], "origin_place" => params["origin_place"], "destination" => params["destination"]}
	Shuttle.create(shuttle)

	erb(:shuttles, { locals: {shuttles: Shuttle.all()} })
end

get('/shuttles') do
	erb(:shuttles, { locals: {shuttles: Shuttle.all()} })
end

get('/shuttles/:id') do
	list = []
	shuttle = Shuttle.find_by("id", params["id"])
	astronauts = Astronaut.select_by("shuttle_id", shuttle["id"])
	erb(:shuttle, { locals: {shuttle: shuttle, astronauts: astronauts} })
end





