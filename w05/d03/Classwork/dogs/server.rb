require_relative "./lib/connection"
require_relative "./lib/breeds"
require "sinatra"
require "sinatra/reloader"
require "httparty"
require "pry"

after do
  ActiveRecord::Base.connection.close
end

get "/" do 
	erb(:main, {locals: { breeds: Breed.all}})
end

post "/new_breed" do

	breed = params["breed"]
	api = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=dc6b5a443c5643fc4196735ab2ea2b38&animal=dog&format=json&breed=#{breed}&output=basic")
	url = api["petfinder"]["pet"]["media"]["photos"]["photo"][8]["$t"]
	new_breed = {breed: params["breed"], url: url}
	Breed.create(new_breed)
	redirect "/"
end

delete "/:id" do
	breed = Breed.find_by(id: params[:id])
	breed.destroy
	redirect "/"
end

get "/:id/edit" do 
	breed = Breed.find_by(id: params[:id])
	erb(:"breeds/edit", locals: { breed: breed})
end

put "/:id" do 
	breed_edit = {breed: params[:breed]}
	breed = Breed.find_by(id: params[:id])
	breed.update(breed_edit)
	redirect "/"
end










