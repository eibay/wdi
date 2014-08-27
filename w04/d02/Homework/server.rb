require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/shuttles.rb'
require_relative './lib/astronaut.rb'

get '/' do
	erb(:index)
end

get '/shuttles' do
	erb( :shuttles, { locals: { shuttles: Shuttle.all() } } )
end

post '/shuttles' do

	name = params["name"]
	origin = params["origin"]
	destination = params["destination"]

	shuttle = {name: name, origin_country: origin, destination: destination}

	Shuttle.create(shuttle)

	erb( :shuttles, { locals: { shuttles: Shuttle.all() } } )
end


get '/shuttles/:id' do
	shuttle = Shuttle.find_by("id", params["id"])
	shuttle_id = params["id"]
	
	astronauts = Astronaut.select_by("shuttle_id", shuttle_id)
	
	erb(:shuttle, {locals: {shuttle: shuttle, astronauts: astronauts}})
end


get '/astronauts' do
	shuttles = Shuttle.all()
	astronauts= Astronaut.all()
	
	erb(:astronauts, {locals: {shuttles: shuttles, astronauts: astronauts}})

end


post '/astronauts' do
	first= params["first"]
	last= params["last"]
	rank= params["rank"]
	shuttle_id= params["shuttle_id"]

	astronaut = {"first" => first, "last" => last, "rank" => rank, "shuttle_id" => shuttle_id}

	astronauts = Astronaut.create(astronaut)

	erb(:astronauts, {locals: {shuttles: Shuttle.all(), astronauts: Astronaut.all() }})

end

get '/astronaut/:id' do 
	astronaut = Astronaut.find_by("id", params["id"])
	shuttle_id= astronaut["shuttle_id"]
	shuttle = Shuttle.find_by("id", shuttle_id)
	
	erb(:astronaut, {locals: {astronaut: astronaut, shuttle: shuttle}})

end











