require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/breed'


post("/breeds") do
  breed_hash = { 
    breed: params["breed"] 
  }
  
  Breed.create(breed_hash)

  erb(:main, { locals: { breed: params["breed"], breeds: Breed.all() } })
end

get("/") do

  erb(:main, { locals: { breed: params["breed"], breeds: Breed.all() } })
end





#HTTParty.get("http:127.0.0.1:4567", {:body => {:breed => breed} })
