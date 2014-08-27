require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronaut'
require_relative './lib/shuttle'

get("/") do 
	erb(:index)
end

post("/astronauts") do
	astronaut = {"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}

	Astronaut.create(astronaut)

	erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts") do
	erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts/new") do
	erb(:new_astronaut, { locals: { shuttles: Shuttle.all() } })
end

get("/astronauts/:id") do
	astronaut = Astronaut.find_by("id", params[:id])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])

	erb(:astronaut, { locals: { astronaut: astronaut, shuttle: shuttle } })
end

get("/shuttles/new") do
	erb(:new_shuttle)
end

get("/shuttles/:id") do
	shuttle = Shuttle.find_by("id", params[:id])
	astronauts_in_shuttle = Astronaut.select_by("shuttle_id", shuttle["id"])

	erb(:shuttle, { locals: { shuttle: shuttle, astronauts: astronauts_in_shuttle } })
end

post("/shuttles") do
	shuttle = { name: params["name"], country: params["country"], destination: params["destination"] }

	Shuttle.create(shuttle)

	erb(:shuttles, { locals: { shuttles: Shuttle.all() } })

end

get("/shuttles") do
	erb(:shuttles, { locals: { shuttles: Shuttle.all() } })
end







