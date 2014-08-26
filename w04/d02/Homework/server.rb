require 'sinatra'
require_relative "./lib/shuttles"
require_relative "./lib/astronauts"

# TODO 
# create nav partial 

get '/' do 
	# navigation 
	# description of services 

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

end 

get "/shuttles" do 
	# navigation 
	# list all shuttles 

end 

get "/astronauts/:astronaut_id" do 
	# navigation 
	# an astronaut profile 

end 

get "/shuttles/:shuttle_id" do
	# navigation 
	# a shuttle profile 

end 