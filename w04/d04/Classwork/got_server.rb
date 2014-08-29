require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative "./character"
require_relative "./house"

get("/") do
  erb(:index)
end

post("/characters") do
  character = {"name" => params["name"], "age" => params["age"], "house_id" => params["house_id"]}

  Character.create(character)

  erb(:characters, {locals: { characters: Character.all() }})
end

get("/characters") do
  erb(:characters, {locals: { characters: Character.all() }})
end


get("/characters/new") do
  erb(:new_character, {locals: {houses: House.all() }})
end

get("/characters/:id") do
  character = Character.find_by("id", params[:id])
  house = House.find_by("id", character["house_id"])

  erb(:character, {locals: {character: character, house: house }})
end

#####################################################################

get("/houses") do
  erb(:houses, {locals: {houses: House.all() }})
end

get("/houses/:id") do
  house = House.find_by("id", params[:id])

  characters_inside_house = Character.select_by("house_id", house["id"])

  erb(:house, {locals: {house: house, characters: characters_inside_house }})
end

# get("/houses/new") do

#   erb(:new_house, {locals: {houses: House.all() }})
# end


# post("/houses") do
#   house = {name: params["name"], image_url: params["image_url"]}

#   House.create(house)

#   erb(:houses, {locals: {houses: House.all() }})

# end