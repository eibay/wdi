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

	erb :new_astronaut, {locals: {shuttles: Shuttle.all, view_name: "Add Astronauts"}}
end 

post "/astronauts" do 


	redirect "/astronauts"
end 

post "/shuttles" do 


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
	shuttle = Shuttle.find_by "id", astronaut.shuttle_id  

	erb :astronaut, {locals: {astronaut: astronaut, shuttle: shuttle, view_name: astronaut.name}} 
end 

get "/shuttles/:shuttle_id" do
	# a shuttle profile

	# get the shuttle obj  
	id = params[:shuttle_id]
	shuttle = Shuttle.find_by "id", id  

	# get the astronauts in it 
	a = Astronauts.all 
	astronauts = a.find_all_by "shuttle_id", id 


	erb :shuttle, {locals: {shuttle: shuttle, astronauts: astronauts, view_name: shuttle.name}} 
end 