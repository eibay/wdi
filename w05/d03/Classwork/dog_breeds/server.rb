require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

after do 
	ActiveRecord::Base.connection.close	
end

get("/") do
	erb(:"breeds/index", { locals: { breeds: Breed.all() } })
end

post("/") do
	response = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=70bc8ee92b5000827fd05c8003f97c6a&animal=dog&format=json&output=basic")
	breed = Breed.new
	breed.breed=params[:breed]
	breed.img_url=response["petfinder"]["pet"]["media"]["photos"]["photo"][0]["$t"]
	breed.save
	erb(index, { locals:{ breeds: breeds } })
end

get("/breeds/new") do
	erb(:"breeds/new", { locals: { breeds: Breed.all() } })
end

post("/breeds") do
	breed_hash = {
		breed: params["breed"]
	}

Breed.create(breed_hash)

erb(:"breeds/index", { locals: { breeds: Breed.all() } })
end


get("/breeds/:id/edit") do
	breed = Breed.find_by({id: params[:id]})

	erb(:"breeds/edit", { locals: { breed: breed, breeds: Breed.all()} })
end

put("/breeds/:id") do

	response = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=70bc8ee92b5000827fd05c8003f97c6a&animal=dog&format=json&output=basic")
	breed = Breed.find_by({id: params[:id]})
	breed.breed=params[:breed]
	breed.img_url=response["petfinder"]["pet"]["media"]["photos"]["photo"][0]["$t"]
	breed.save

	redirect "/"
end

delete("/breeds/:id") do
	breed = Breed.find_by({id: params[:id]})
	breed.destroy

	redirect "/"
end