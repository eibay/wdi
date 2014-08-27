require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "./lib/shuttle.rb"
require_relative "./lib/astronaut.rb"

get("/") do  
	erb(:index)
end

get("/crew") do
	erb(:all_astronauts, {locals: {astronauts: Astronaut.full_array()}})
end

post("/crew") do
	astronaut = {"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}
	Astronaut.create(astronaut)
	erb(:all_astronauts, {locals: {astronauts: Astronaut.full_array()}})
end

get("/fleet") do
	erb(:all_shuttles, {locals: {shuttles: Shuttle.full_array()}})
end

post("/fleet") do
	shuttle = {"name" => params["name"], "origin_country" => params["origin_country"], "destination" => params["destination"]}
	Shuttle.create(shuttle)
	erb(:all_shuttles, {locals: {shuttles: Shuttle.full_array()}})
end

get("/add") do
	erb(:add_new, {locals: {fleet: Shuttle.full_array}})
end

get("/crew/:id") do
	astronaut = Astronaut.find_by("id", params[:id])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:individual_astronaut, {locals: {astronaut: astronaut, shuttle: shuttle}})
end

get("/fleet/:id") do
	shuttle = Shuttle.find_by("id", params[:id])
	crew = Astronaut.select_by("shuttle_id", shuttle["id"])
	erb(:individual_shuttle, {locals: {shuttle: shuttle, crew: crew}})
end
