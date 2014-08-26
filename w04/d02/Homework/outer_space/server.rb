require_relative "./lib/astronaut.rb"
require_relative "./lib/shuttle.rb"
require "sinatra"
require "sinatra/reloader"
require "json"
require "pry"

get "/" do
	erb(:index)
end

get "/astronauts" do
	erb(:astronauts, locals: { list: Astronaut.all})
end

get "/astronaut/view/:id" do
	astronaut = Astronaut.find_by("id", params["id"])
	shuttle = Shuttle.find_by("id", astronaut["shuttle_id"])
	erb(:astronaut, locals: {astronaut: astronaut, shuttle: shuttle})
end

get "/astronaut/add" do
	erb(:astronaut_add, locals: {shuttles: Shuttle.all})
end

post "/astronaut" do
	Astronaut.create({"name" => params["name"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]})
	erb(:astronauts, locals: {list: Astronaut.all})
end

get "/shuttles" do
	erb(:shuttles, locals: {list: Shuttle.all})
end

get "/shuttle/view/:id" do
	shuttle = Shuttle.find_by("id", params["id"])
	passengers = Astronaut.select_by("shuttle_id", shuttle["id"])
	erb(:shuttle, locals: {shuttle: shuttle, list: passengers})
end

get "/shuttle/add" do
	erb(:shuttle_add)
end

post "/shuttle" do
	shuttle = {"name" => params["name"], "origin_country" => params["origin_country"], "destination" => params["destination"]}
	Shuttle.create(shuttle)
	erb(:shuttles, locals: {list: Shuttle.all})
end
