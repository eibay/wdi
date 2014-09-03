require 'sinatra'
require_relative "./lib/breed"
require_relative "./lib/config"

# pages # 

get '/' do 
	erb :main, {locals: {breeds: Breed.all}}
end 

get "/breeds/:id" do 
	erb :breed, {locals: {breed: Breed.find_by({id: params[:id]})}}
end 

# actions # 

post "/breeds" do

	# Fritz is born! # 
	Breed.new({ 
		   name: params["name"], 
	description: params["description"]
	}).save 

	redirect '/'
end 

put "/breeds/:id" do

   # Fritz is growing & changing # 
  Breed.find_by({id: params[:id]}).update({
  	       name: params["name"],
  	description: params["description"]})

  redirect '/'
end 

delete "/breeds/:id" do
	# now we have to put Fritz to sleep, Clayton # 
	Breed.find_by({id: params[:id]}).destroy

	redirect '/'
end 

# api route # 

get "/api" do 
	Breed.all.to_json 
end 

