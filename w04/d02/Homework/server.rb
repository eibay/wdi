require 'sinatra'
require 'sinatra/reloader'
require 'securerandom'
require 'pry'
require_relative "./lib/astronauts"
require_relative "./lib/shuttles"

get"/" do
	erb(:index)
end

get("/shuttles/new") do
	erb(:new_shuttle)
end

post "/shuttles" do
	name=params[:name]
	origin_country=params[:origin_country]
	destination=params[:destination]
	id=SecureRandom.hex
	shuttle={"name"=>name , "origin_country"=>origin_country , "destination"=>destination , "id"=>id}
	Shuttle.create(shuttle)
	erb(:shuttle, {locals:{shuttles: Shuttle.all()}})
end

get "/shuttles" do
	erb(:shuttle, {locals:{shuttles: Shuttle.all()}})
end
get "/shuttles/" do
	erb(:shuttle, {locals:{shuttles: Shuttle.all()}})
end

get "/astronauts/new" do

	erb(:new_astronaut , {locals:{shuttles: Shuttle.all()}})
end


post "/astronauts" do
	name=params[:name]
	rank=params[:rank]
	shuttle_id=params[:shuttle_id]
	id=SecureRandom.hex
	astronaut={"name" => name ,  "rank"=>rank , "id"=>id, "shuttle_id"=>shuttle_id }
	Astronaut.create(astronaut)

	erb(:astronaut, {locals:{astronauts: Astronaut.all()}})
end

get "/astronauts" do
	erb(:astronaut, {locals:{astronauts: Astronaut.all()}})
end
get "/astronauts/" do
	erb(:astronaut, {locals:{astronauts: Astronaut.all()}})
end


get "/astronauts/:id" do
	id=params[:id]
	astronaut=Astronaut.find_by("id" , id)
	shuttle=Shuttle.find_by("id" , astronaut['shuttle_id'])
	erb(:individual_astronaut, {locals:{astronaut: astronaut , shuttle: shuttle}})
end
get "/shuttles/:id" do
	id=params[:id]
	shuttle=Shuttle.find_by("id" , id)
	astronauts=Astronaut.select_by("shuttle_id" , id)
	erb(:individual_shuttle, {locals:{shuttle: shuttle, astronauts: astronauts}})
end