require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronaut'
require_relative './lib/space_shuttle'

get("/") do
  erb(:index)
end


post("/astronauts") do
  astronaut = {"first" => params["first"], "last" => params["last"], "rank" => params["rank"], "shuttle_id" => params["shuttle_id"]}

  Astronaut.create(astronaut)

  erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts") do 
  erb(:astronauts, { locals: { astronauts: Astronaut.all() } })
end

get("/astronauts/new") do
  erb(:new_astronaut, { locals: { shuttles: Shuttle.all() } }) 
  # we need to pass Shuttle.all() to the .erb doc because it will populate our shuttle drop down menu. wouldn't have thought of that :)
end


# QUESTION - how do we get to this path - since it doesn't look like we have a page to search for a student? Would this be from someone typing in the student id in the browser after /students? YES - unless we make a search page and a link to it!

get("/astronauts/:id") do # ':' stands in place of something we're going to sub in
  astronaut = Astronaut.find_by("id", params[:id])
  shuttle = Shuttle.find_by("id", astronaut["shuttle_id"]) #we need this line to be able to display that student's particular shuttle

  erb(:astronaut, { locals: { astronaut: astronaut, shuttle: shuttle } })
end


post("/shuttles") do
  shuttle = { name: params["name"], origin_country: params["origin_country"], destination: params["destination"] }

  Shuttle.create(shuttle)

  erb(:shuttles, { locals: { shuttles: Shuttle.all() } })
end

get("/shuttles") do
  erb(:shuttles, { locals: { shuttles: Shuttle.all() } })
end

get("/shuttles/new") do
  erb(:new_shuttle)
end

get("/shuttles/:id") do
  shuttle = Shuttle.find_by("id", params[:id])
  astronauts_in_shuttle = Astronaut.select_by("shuttle_id", shuttle["id"])

  erb(:shuttle, { locals: { shuttle: shuttle, astronauts: astronauts_in_shuttle } })
end

