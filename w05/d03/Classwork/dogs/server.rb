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
	breeds=Breed.all.order(id: :asc)

erb(:index, {locals:{breeds: breeds}})

end

post("/") do
	http=HTTParty.get("http://api.petfinder.com/pet.getRandom?key=b476dbce46a562367f4ccb03f49a0743&animal=dog&breed=#{params[:name]}&format=json&output=basic")
	# http["petfinder"]["pet"]["breeds"]["breed"]["$t"]  
	breeds=Breed.all.order(id: :asc)
	breed=Breed.new
	breed.name=params[:name]
	breed.images=http["petfinder"]["pet"]["media"]["photos"]["photo"][3]["$t"]
	breed.save
	erb(:index, {locals:{breeds: breeds}})
end
delete("/:id") do
	breed=Breed.find_by(id: params[:id])
	breed.destroy
	redirect "/"
end

get("/edit/:id") do
	breed=Breed.find_by(id: params[:id])
	erb(:edit, {locals:{breed:breed}})
end

put ("/:id") do
		

	http=HTTParty.get("http://api.petfinder.com/pet.getRandom?key=b476dbce46a562367f4ccb03f49a0743&animal=dog&breed=#{params[:name]}&format=json&output=basic")
	breed=Breed.find_by(id: params[:id])
	breed.name=params[:name]
	breed.images=http["petfinder"]["pet"]["media"]["photos"]["photo"][3]["$t"]
	breed.save
	redirect "/"
end



