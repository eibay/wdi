require 'sinatra'
require_relative "./lib/shuttles"
require_relative "./lib/astronauts"

# TODO 
# create nav partial 

get '/' do 
	# navigation 
	# description of services 

	erb :index
end 

get "/shuttles/new" do 
	# navigation 
	# form to create a new shuttle

end 

get "/astronauts/new" do 
	# navigation 
	# form to create a new astronaut 

end 

get "/astronauts" do
	# navigation 
	# list all astronauts 

	erb :astronauts
end 

get "/shuttles" do 
	# navigation 
	# list all shuttles 

	erb :shuttles
end 

get "/astronauts/:astronaut_id" do 
	# navigation 
	# an astronaut profile 

	erb :astronaut 
end 

get "/shuttles/:shuttle_id" do
	# navigation 
	# a shuttle profile 

	erb :shuttle
end 