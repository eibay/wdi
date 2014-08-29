require 'json'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/house.rb'
require_relative './lib/character.rb'

# binding.pry

get '/' do

  erb(:index)
end

get '/houses' do

  data_houses = House.all()

  erb(:houses, {locals: {data_houses: data_houses}})
end

get '/houses/:id' do
  id = params["id"]


  data_house = House.find_by("id", id)

  erb(:houses_profile, {locals: {data_house: data_house}})
end



get '/characters' do

  data_characters = Character.all()

  erb(:characters, {locals: {data_characters: data_characters}})
end


get '/characters/new' do

  erb(:characters_new)
end

post '/characters/new' do
  name = params["name"]
  house = params["house"]

  house_id = House.find_by("name", house)["id"]

  character = {"name" => name, "id" => SecureRandom.hex, "house_id" => house_id}

  Character.create(character)

  erb(:characters_new)
end



get '/characters/:id' do
  # binding.pry
  id = params["id"]
  data_character = Character.find_by("id", id)
  # binding.pry
  data_house = House.find_by("id", data_character["house_id"])


  erb(:characters_profile, {locals: {data_character: data_character, data_house: data_house}})
end

