require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/shuttle'
require_relative './lib/astronaut'

get "/" do

  erb(:index)
end

get "/shuttles" do
  shuttles = Shuttle.all()

  erb(:shuttles, locals: {shuttles: shuttles})
end

get "/shuttles/new" do
  erb(:new_shuttles)
end

post "/shuttles" do
  shuttles = Shuttle.all()
  name = params[:name]
  origin = params[:origin]
  destination = params[:destination]

  new_shuttle = {name: name, origin: origin, destination: destination}

  Shuttle.create(new_shuttle)
  erb(:shuttles, locals: {shuttles: shuttles})
end

get "/astronauts" do
  astronauts = Astronaut.all()

  erb(:astronauts, locals: {astronauts: astronauts})
end

get "/astronauts/new" do
  shuttles = Shuttle.all()
  erb(:new_astronaut, locals: {shuttles: shuttles})
end

post "/astronauts" do
  astronauts = Astronaut.all()
  shuttles = Shuttle.all()
  name = params[:name]
  rank = params[:rank]
  shuttle = params[:shuttle_id]

  s = Shuttle.find_by("id", shuttle)
  shuttle_name = s["name"]


  astronaut = {name: name, rank: rank, shuttle_id: shuttle, shuttle_name: shuttle_name}

  new_astronaut = Astronaut.create(astronaut)


  erb(:astronauts,  locals: {astronauts: astronauts, shuttles: shuttles})
end
