require 'sinatra'
require_relative "./lib/shuttles"
require_relative "./lib/astronauts"

get '/' do 
	erb :index, {locals: {view_name: "About Us"}}
end 

get "/shuttles/new" do 
	# form to create a new shuttle

	erb :new_shuttle, {locals: {view_name: "Add Shuttles"}}
end 

get "/astronauts/new" do 
	# form to create a new astronaut 
	# needs shuttles for select menu 

	erb :new_astronaut, {locals: {shuttles: Shuttle.all, view_name: "Add Astronauts"}}
end 

post "/astronauts" do 

	# if values missing, redirect to all astronauts 
	if params["name"] != '' && params["rank"] != ''

		# get the definite values 
		name, rank = params["name"], params["rank"]

		if params["shuttle_id"] 

			shuttle_id = params["shuttle_id"]
			a = Astronaut.new name, rank, shuttle_id 
		else

			# create an earth-bound astronaut 
			a = Astronaut.new name, rank
		end 

		a.create 
	end 

	redirect "/astronauts" 
end 

post "/shuttles" do 

	name, origin_country, destination = params["name"], params["origin_country"], params["destination"]

	# check for empty strs else just redirect to shuttles 
	if name != '' && origin_country != '' && destination != ''
		s = Shuttle.new name, origin_country, destination
		s.create 
	end 

	redirect "/shuttles" 
end 

get "/astronauts" do

	erb :astronauts, {locals: {astronauts: Astronaut.all, view_name: "All Astronauts"}}
end 

get "/shuttles" do 
	# list all shuttles 

	erb :shuttles, {locals: {shuttles: Shuttle.all, view_name: "All Shuttles" }}
end 

get "/astronauts/:astronaut_id" do 
	# an astronaut profile 

	# get the astronaut 
	id = params[:astronaut_id]
	astronaut = Astronaut.find_by "id", id 

	# get the shuttle obj associated w/ them
	if astronaut.shuttle_id == false 
		shuttle = false 
	else 
		shuttle = Shuttle.find_by "id", astronaut.shuttle_id  
	end 

	erb :astronaut, {locals: {astronaut: astronaut, shuttle: shuttle, view_name: astronaut.name}} 
end  

get "/shuttles/:shuttle_id" do
	# a shuttle profile

	# get the shuttle obj  
	id = params[:shuttle_id]
	shuttle = Shuttle.find_by "id", id  

	# get the astronauts in it 
	astronauts = Astronaut.find_all_by "shuttle_id", id 


	erb :shuttle, {locals: {shuttle: shuttle, astronauts: astronauts, view_name: shuttle.name}} 
end 