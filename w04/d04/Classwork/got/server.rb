require 'sinatra'
require 'sinatra/reloader'
require_relative './characters'
require_relative './houses'
require 'pry'

get ("/") do
	erb(:index)
end
	
get("/characters/new") do
	erb(:new_character)
end

post ("/characters") do
	name=params[:name]
	image=params[:image]
	house_id=Houses.all.sample.attributes["id"]  
	character={"name"=>name , "picture"=>image , "house_id"=>house_id}
	Characters.create(character)

	erb(:characters, {locals: {characters:Characters.all}})
end

get("/characters") do
	erb(:characters, {locals: {characters:Characters.all}})
end

get("/characters/") do
	erb(:characters, {locals: {characters:Characters.all}})
end

get("/houses") do
	erb(:houses, {locals: {houses:Houses.all}})
end

get("/houses/") do
	erb(:houses, {locals: {houses:Houses.all}})
end

get("/houses/:id") do
	house=Houses.find_by("id", params[:id])
	name=house.attributes["name"]
	age=house.attributes["age"]
	characters=house.characters
	
	erb(:house, {locals: {name: name, age: age, characters:characters}})
end

get("/characters/:id") do

	character=Characters.find_by("id", params[:id])
	name=character.attributes["name"]
	image=character.attributes["picture"]
	house=character.house
	erb(:character, {locals: {name: name, image: image, house:house}})
end








































