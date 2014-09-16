require 'sinatra'
require 'json'
require 'httparty'
require 'active_record'
require 'pry'
require_relative './lib/connection'
require_relative './lib/dog'
require_relative './lib/image'

after do
	ActiveRecord::Base.connection.close
end

get('/') do
	erb(:index)
end

get('/dogs') do
	erb(:"dogs/index", { locals: { dogs: Dog.all(), image: Image.all() }})
end

post('/dogs') do
	dog = {"name" => params["name"], "breed" => params["breed"]}
	dog = Dog.create(dog)
	image = HTTParty.get('http://api.petfinder.com/pet.getRandom?key=70bc8ee92b5000827fd05c8003f97c6a&animal=dog&format=json&output=basic')
	url = image["petfinder"]["pet"]["media"]["photos"]["photo"].sample["$t"]
	image = {"dog_id" => dog.id, "image_link" => url}
	binding.pry
	Image.create(image)

	erb(:"dogs/index", { locals: { dogs: Dog.all(), image: Image.all() }})
end

delete('/dogs/:id') do
	dog = Dog.find_by(id: params[:id])
	dog.destroy

	redirect "/dogs"
end

get('/dogs/edit/:id') do
	dog = Dog.find_by(id: params[:id])

	erb(:"dogs/edit", { locals: { dog: dog }})
end

put('/dogs/:id') do
	dog = Dog.find_by({id: params[:id]})
	dog_hash = { 
    name: params["name"], 
    breed: params["breed"], 
  	}
  	dog.update(dog_hash)

  	redirect "/dogs"
end

