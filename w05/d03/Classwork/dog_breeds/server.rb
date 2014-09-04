require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection.rb'
require_relative './lib/dog.rb'
require 'HTTParty'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end


get "/" do
  erb(:index, locals: {breeds: Breed.all()})
end

post "/new" do
  name = params[:breed]
  pet_api=HTTParty.get("http://api.petfinder.com/pet.getRandom?key=b476dbce46a562367f4ccb03f49a0743&animal=dog&breed=#{params[:name]}&format=json&output=basic")
  Breed.create({name: name})

  erb(:index, locals: {breeds: Breed.all()})
end

get "/:id" do
  breed = Breed.find_by({id: params["id"]})
  erb(:edit, { locals: {breed: breed}})
end

put "/edit/:id" do

  breed = Breed.find_by({id: params[:id]})
  breed_info = {name: params["breed"]}
  breed.update(breed_info)

  erb(:index, locals: {breeds: Breed.all()})
end

delete "/:id" do
  breed = Breed.find_by({id: params[:id]})
  breed.destroy

  redirect "/"
end
