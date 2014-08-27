require 'sinatra'
require 'pry'
require_relative ("./libs/methods")


get ("/") do 
	erb(:index)
end


get ("/shuttle/new") do 
	erb(:shuttle_new)
end

post ("/shuttle") do 
	new_shuttle = {"name" => params["name"], "origin_country" => params["origin_country"], "destination"=> params["destination"]}
	Shuttle.create(new_shuttle)
	erb(:shuttle, { locals: { shuttle: Shuttle.all()}})
end

get ("/shuttle") do 
	erb(:shuttle, { locals: { shuttle: Shuttle.all()}})
end

get ("/astronaut/new") do
	erb(:astronaut_new, {locals: { shuttle: Shuttle.all()}})
end

post ("/astronaut") do 
	new_astronaut = {"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}
	Astronaut.create(new_astronaut)
	erb(:astronaut, {locals: {astronaut: Astronaut.all() }})
end 

get ("/astronaut") do 
	erb(:astronaut, {locals: {astronaut: Astronaut.all() }})
end

get ("/astronaut/search/:id") do 
	astronaut = Astronaut.find_by("id", params[:id])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:astro_search, {locals: {astronaut: astronaut, shuttle: shuttle }})
end


get ("/shuttle/search/:id") do 
	shuttle = Shuttle.find_by("id", params[:id])
	astros_in_shuttle = Astronaut.select_by("shuttle_id", shuttle["id"])
	erb(:shuttle_search, {locals: { shuttle: shuttle, astronaut: astros_in_shuttle}})
end 




