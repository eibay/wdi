require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'httparty'
require_relative './lib/breed.rb'
require_relative './lib/connection.rb'



after do
  ActiveRecord::Base.connection.close
  # after every do, close connection. gotta close connections otherwise will be overloaded
end

get '/' do 
  list_breeds = Breed.all

  erb(:index, {locals: {list_breeds: list_breeds}})
end


post '/new' do 

  api = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=a85891abadd3bab6c6f9a2bd91ebaebd&animal=dog&format=json&breed=#{params["breed"]}&output=basic")
  api_photos = api["petfinder"]["pet"]["media"]["photos"]["photo"]
  api_photo_one = api_photos[rand(api_photos.length)]["$t"]

  new_breed = {breed: params["breed"], url: api_photo_one} # is this a hash of a hash?
  b = Breed.new(new_breed)
  b.save

  redirect '/'
end


delete '/breed/:id' do
  breed_to_delete = Breed.find_by({id: params[:id]})
  breed_to_delete.destroy

  redirect '/'
end

get '/edit/:id' do
  breed_to_edit = Breed.find_by({id: params[:id]})

  erb(:edit, {locals: {breed_to_edit: breed_to_edit}})
end

put '/edit/:id' do
  breed_to_edit = Breed.find_by({id: params[:id]})
  breed_change = params["breed_change"]
  breed_to_edit.breed = breed_change
  breed_to_edit.save

  redirect '/'
end


# Congratulations, you have access to the Petfinder API!
# Welcome:
# Log out
# API Key
# a85891abadd3bab6c6f9a2bd91ebaebd
# API Secret
# ac33e5269325e3bc16198cb076c8b298
# API Status
# Active

# http://api.petfinder.com/pet.getRandom?key=a85891abadd3bab6c6f9a2bd91ebaebd&animal=dog&format=json&breed=#%7Bbreed%7D&output=basic



