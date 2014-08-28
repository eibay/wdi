require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './library/shuttle'
require_relative './library/astronaut'


get("/") do  
	erb(:index)
end

post("/shuttles") do
  shuttle = {"name" => params["name"], "origin_country" => params["origin_country"], "destination" => params["destination"]}

  Shuttle.create(shuttle)

  erb(:shuttles, { locals: { shuttles: Shuttle.all() } })
end

get("/shuttles") do
  erb(:shuttles, { locals: { shuttles: Shuttle.all() } })
end

get("/shuttles/new") do
	erb(:new_shuttle { astronauts: Astronaut.all() } })
end

get("/shuttles/:id") do 
  shuttle = Shuttle.find_by("id", params[:id])
  astronaut = Astronaut.find_by("id", shuttle["astronaut_id"])

  erb(:shuttle, {locals: { shuttle: shuttle, astronaut: astronaut } })
end

get("/") do  
	erb(:index)
end

post("/astronauts") do
  student = {"name" => params["name"], "rank" => params["rank"]}

  Astronaut.create(student)

  erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts") do
  erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts/new") do
	erb(:new_astronaut)
end

get("/astronauts/:name") do 
  astronaut = Astronaut.find_by("name", params[:name])

  erb(:astronaut, { locals: { astronaut: astronaut } })
end

