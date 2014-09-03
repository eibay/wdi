require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/breed'


get("/") do
  erb(:main)
end


post("/breeds") do
  breed_hash = { 
    breed: params["breed"] 
  }

  Breed.create(breed_hash)

  erb(:main, { locals: { breeds: Breed.all() } })
end




#HTTParty.get("http:127.0.0.1:4567", {:body => {:breed => breed} })
