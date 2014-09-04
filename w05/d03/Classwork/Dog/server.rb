require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'


get("/") do

  erb(:main, { locals: { breed: params["breed"], breeds: Breed.all() } })
end

post("/breeds") do
  breed_hash = { 
    breed: params["breed"] 
  }
  
  Breed.create(breed_hash)

  erb(:main, { locals: { breed: params["breed"], breeds: Breed.all() } })
end

delete("/breeds/delete/:id") do
  breed = Breed.find_by({id: params[:id]})
  breed.destroy

  redirect "/"
end

post("/breeds/edit/:id") do
  breed = Breed.find_by({id: params[:id]})
  # it knows what the breed is
  erb(:edit, { locals: { breed: breed, breeds: Breed.all() } })
end

put("/breeds/edit/:id") do
  breed = Breed.find_by({id: params[:id]})
  # it knows what the breed is
  #change the name
  breed_name = params["breed"]
  breed.update({breed: breed_name})
  
  redirect "/"

end







#HTTParty.get("http:127.0.0.1:4567", {:body => {:breed => breed} })
