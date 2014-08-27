require 'sinatra'
require 'json'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronaut.rb'
require_relative './lib/shuttle.rb'

get '/' do 
  erb(:index)
end

#####################
### Shuttles      ###
#####################

get '/shuttles_page' do 
  data_shuttle = Shuttle.get_data
  erb(:shuttles_page, {locals: {data_shuttle: data_shuttle}})
end

post '/shuttles_page' do 
  shuttle = {"name" => params["name"], "origin" => params["origin"], "destination" => params["destination"]}
  Shuttle.create(shuttle)

  data_shuttle = Shuttle.get_data
  erb(:shuttles_page, {locals: {data_shuttle: data_shuttle}})
end

get '/shuttle/:id' do #Put stuff here 
  # name = request.path.split("/")[2]
  shuttle = Shuttle.search("id", params["id"]) #this makes the shuttle uniquely the one you searched for
  shuttle_crew = Astronaut.search_all("shuttle_id", shuttle["id"])

  data_shuttle = Shuttle.get_data; data_astronaut = Astronaut.get_data
  erb(:shuttle_profile, {locals: {data_shuttle: data_shuttle, data_astronaut: data_astronaut, shuttle: shuttle, shuttle_crew: shuttle_crew}})
end



#####################
### Astronauts    ###
#####################

get '/astronauts_page' do 

  data_shuttle = Shuttle.get_data; data_astronaut = Astronaut.get_data
  erb(:astronauts_page, {locals: {data_astronaut: data_astronaut, data_shuttle: data_shuttle}})
end

post '/astronauts_page/new' do 
  astronaut = {"name" => params["name"].capitalize, "rank" => params["rank"].capitalize, "shuttle_id" => params["shuttle_id"]}
  Astronaut.create(astronaut)
  # placing this data retrieval afterwards so that the info is up to date, after being updated
  data_shuttle = Shuttle.get_data; data_astronaut = Astronaut.get_data
  erb(:astronauts_page, {locals: {data_astronaut: data_astronaut, data_shuttle: data_shuttle}})
end

get '/astronaut/:id' do #Put stuff here 
  astronaut = Astronaut.search("id", params["id"])
  shuttle = Shuttle.search("id", astronaut["shuttle_id"])
  data_shuttle = Shuttle.get_data; data_astronaut = Astronaut.get_data
  erb(:astronaut_profile, {locals: {data_shuttle: data_shuttle, data_astronaut: data_astronaut, astronaut: astronaut, shuttle: shuttle}})
end

