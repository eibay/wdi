require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/dog'
require_relative './seed'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/dogs") do
  erb(:"breeds/index", { locals: { dogs: Dog.all(), } })
end

get("/dogs/new") do
  erb(:"breeds/new")
end

post("/dogs") do
  dog_hash = { 
  breed: params["breed"]}

Dog.create(dog_hash)

  erb(:"breeds/index", { locals: { dogs: Dog.all() } })
end

get("/dogs/:id") do
  response = HTTParty.get('http://api.petfinder.com/pet.getRandom?key=1d05e5ee14eca9c51dbc9e4ca9bb99bd&animal=dog&breed=labrador&format=json')
  imageid = response["petfinder"]["petIds"]["id"]["$t"]
  dog = Dog.find_by({id: params[:id]})
  erb(:"breeds/show", { locals: { dog: dog, imageid: imageid } })
  dog.save

end

get("/dogs/:id/edit") do
  dog = Dog.find_by({id: params[:id]})
  erb(:"breeds/edit", { locals: { dog: dog, dogs: Dog.all() } })
end

put("/dogs/:id") do
  dog_hash = {  
    breed: params["breed"]}
    
  dog = Dog.find_by({id: params[:id]})
  response = HTTParty.get('http://api.petfinder.com/pet.getRandom?key=1d05e5ee14eca9c51dbc9e4ca9bb99bd&animal=dog&breed=labrador&format=json')
  imageid = response["petfinder"]["petIds"]["id"]["$t"]
  dog.update(dog_hash)


  erb(:"breeds/index", { locals: { dogs: Dog.all(), imageid: imageid } })
end

delete("/dogs/:id") do
  dog = Dog.find_by({id: params[:id]})
  dog.destroy

  redirect "/dogs"
end

# http://photos.petfinder.com/photos/pets/29784496/1/?bust=1384014481&width=300&-pn.jpg

# http://api.petfinder.com/pet.getRandom?key=1d05e5ee14eca9c51dbc9e4ca9bb99bd&animal=dog&breed=labrador&format=json