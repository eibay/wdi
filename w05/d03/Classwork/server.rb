require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/dog'

after do
  ActiveRecord::Base.connection.close
end


get '/' do 

dogs = Dog.all
	erb(:index, {locals: {dogs: dogs}})

end

post '/' do

	breed = params['breed']

	random_dog = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=ebbb4d993923eb8fae3ac427bf20813f&animal=dog&breed=#{breed}&output=basic&format=json")

	url = random_dog["petfinder"]["pet"]["media"]["photos"]["photo"][3]["$t"]

	dog = Dog.new({breed: breed, url: url})
	dog.save

	redirect '/'
end

delete '/dog/:id' do

	dog = Dog.find_by(id: params['id'])
	dog.destroy

	redirect '/'

end

get '/edit/:id' do
	dog = Dog.find_by(id: params['id'])

	erb(:edit, {locals: {dog: dog}})
end


put '/edit/:id' do
	
	breed = params['breed']
	random_dog = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=ebbb4d993923eb8fae3ac427bf20813f&animal=dog&breed=#{breed}&output=basic&format=json")

	url = random_dog["petfinder"]["pet"]["media"]["photos"]["photo"][3]["$t"]

	dog_hash={breed: params['breed'], url: url}
	dog = Dog.find_by(id: params['id'])
	
	dog.update(dog_hash)

redirect '/'

end










