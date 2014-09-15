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
  erb(:index)
end

get("/breeds") do
  erb(:"breeds/index", {locals: { breeds: Breed.all() }})
end

get("/breeds/new") do
  erb(:"breeds/new", {locals: { breeds: Breed.all() }})
end

post("/breeds") do
  breed = Breed.new
  api_call = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=dc6b5a443c5643fc4196735ab2ea2b38&animal=dog&breed=#{params[:species]}&format=json&output=basic")
  image_url = api_call["petfinder"]["pet"]["media"]["photos"]["photo"][8]["$t"]
  breed_hash = {
    species: params["type"],
    age: params["age"],
    image_url: params["image_url"]
  }
    #binding.pry
  Breed.create(breed_hash)
  redirect '/'

  # erb(:"breeds/index", { locals: { breeds: Breed.all() }})
end

get("/breeds/:id") do
  breed = Breed.find_by({id: params[:id]})
  erb(:"breeds/show", {locals: {breed: breed }})
end

get("/breeds/:id/edit") do
  breed = Breed.find_by({id: params[:id]})
  erb(:"breeds/edit", {locals: { breed: breed }})


end

put("/breeds/:id") do
  api_call = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=dc6b5a443c5643fc4196735ab2ea2b38&animal=dog&breed=#{params[:species]}&format=json&output=basic")
  breed_hash = {
    type: params["type"],
    age: params["age"],
    image_url: params["image_url"]
  }

  breed = Breed.find_by({id: params[:id]})
  breed.update(breed_hash)

  erb(:"breeds/show", {locals: { breed: breed }})
end

delete("/breeds/:id") do
  breed = Breed.find_by({id: params[:id]})
  breed.destroy

  redirect '/'
end


