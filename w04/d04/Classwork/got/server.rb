require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './house'
require_relative './character'
require_relative './model'

get("/") do 
	erb(:index)
end

post("/characters") do
	character = {"name" => params["name"], "image_url" => params["image_url"], "house_id" => params["house_id"]}

	Character.create(character)

	erb(:characters, { locals: { characters: Character.all() } })
end

get("/characters") do
	erb(:characters, { locals: { characters: Character.all() } })
end	

get("/characters/new") do
	erb(:new_character, { locals: { houses: House.all() } })
end

get("/characters/:id") do
	character = Character.find_by("id", params[:id])
	house = House.find_by("id", character["house_id"])

	erb(:character, { locals: { character: character, house: house } })
end

get("/house/:id") do
	house = House.find_by("id", params[:id])
	characters_in_house = Character.select_by("house_id", house["id"])

	erb(:house, { locals: { house: house, characters: characters_in_house } })
end

get("/houses") do
	erb(:houses, { locals: { houses: House.all() } })
end