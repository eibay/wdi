# API Key
# c88dbe9be3849b458890588c93d1a0c9
# API Secret
# fcdcb918b214956963f8cfa424f155db

# ["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]

require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'JSON'
require 'HTTParty'
require_relative './lib/connection'
require_relative './lib/breed'

after do
	ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index, locals: {breeds: Breed.all()})
end

post("/breeds") do 
	api = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=c88dbe9be3849b458890588c93d1a0c9&animal=dog&breed=#{params["breed"]}&format=json&output=basic")

	url = api["petfinder"]["pet"]["media"]["photos"]["photo"][7]["$t"]
	newDog = {
		breed: params["breed"],
		url: url
	}
	Breed.create(newDog)

	redirect "/"
end

delete("/breeds/:id") do 
	dog = Breed.find_by({id: params[:id]})
	dog.destroy

	redirect "/"
end

get("/edit/:id") do 
	dog = Breed.find_by({id: params[:id]})
	erb(:edit, locals: {breeds: dog})
end

put("/breeds/:id") do 
	breed = Breed.find_by({id: params[:id]})
	api = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=c88dbe9be3849b458890588c93d1a0c9&animal=dog&format=json&output=basic&breed=#{params["breed"]}")
	url = api["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]
	dogNewName = {
		breed: params["breed"],
		url: url
	}
	breed.update(dogNewName)

	redirect "/"
end

put("/breeds") do 
	redirect "/"
end

