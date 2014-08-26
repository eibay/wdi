require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronaut'
require_relative './lib/shuttle'

get("/") do
	erb(:index)
end

get("/shuttles") do
	shuttles = Shuttle.all()
	erb(:shuttles, { locals: { shuttles: shuttles } })
end

get("/add-shuttle") do
	erb(:add_shuttle)
end

post("/add-shuttle") do
	Shuttle.new(params[:name], params[:orig], params[:dest])
	redirect("/shuttles")
end

get("/shuttles/:shuttle_id") do
	shuttle = Shuttle.find("id", params[:shuttle_id])
	astronauts = Astronaut.select("shuttle", params[:shuttle_id])
	erb(:shuttle, { locals: { shuttle: shuttle, astronauts: astronauts } })
end

get("/astronauts") do
	astronauts = Astronaut.all()
	erb(:astronauts, { locals: { astronauts: astronauts } })
end

get("/add-astronaut") do
	shuttles = Shuttle.all()
	erb(:add_astronaut, {locals: { shuttles: shuttles } })
end

post("/add-astronaut") do
	Astronaut.new(params[:name], params[:rank], params[:shuttle] )
	redirect("/astronauts")
end

get("/astronaut/:astronaut_id") do
	astronaut = Astronaut.select("id", params[:astronaut_id])
	shuttle = Shuttle.find("id", astronaut[0]["shuttle"])
	erb(:astronaut, {locals: { astronaut: astronaut, shuttle: shuttle } })
end
