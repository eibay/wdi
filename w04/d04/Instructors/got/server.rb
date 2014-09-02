require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/house'
require_relative './lib/character'

get("/") do
  erb(:index)
end

get("/characters") do
  erb(:characters, { locals: { characters: Character.all(), } })
end

get("/characters/new") do
  erb(:new_character, { locals: { houses: House.all(), } })
end

post("/characters") do
  character_hash = { 
    name: params["name"], 
    image_url: params["url"], 
    house_id: params["house_id"]
  }

  Character.create(character_hash)

  erb(:characters, { locals: { characters: Character.all() } })
end

get("/characters/:id") do
  character = Character.find_by("id", params[:id])
  erb(:character, { locals: { character: character } })
end






get("/houses") do
  erb(:houses, { locals: { houses: House.all() } })
end

get("/houses/:id") do
  house = House.find_by("id", params[:id])
  erb(:house, { locals: { house: house } })
end