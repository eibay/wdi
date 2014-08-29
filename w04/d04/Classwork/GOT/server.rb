require 'sinatra'
require 'sinatra/reloader'
require_relative "./character"
require_relative "./house"
require 'pry'

get("/") do
	erb(:index)
end

get("/houses") do
	houses = House.all()
	erb(:houses, { locals: { houses: houses } })
end 

get("/houses/:id") do
	house = House.find_by("id", params["id"])
	characters = house.character
	erb(:house, { locals: { house: house, characters: characters } })
end

get("/characters") do
	characters = Character.all()
	erb(:characters, { locals: { characters: characters } }) 
end

get("/characters/add") do
	houses = House.all()
	erb(:add_char, { locals: { houses: houses } })
end

post("/characters/add") do 
	house = House.find_by("id", params["house"])
	character = Character.create({
		"name"=>params["name"], 
		"image_url"=>params["image_url"],
		"house_id"=>params["house"]
		})
	redirect("/characters")
end

get("/characters/:id") do
	character = Character.find_by("id", params["id"])
	house = character.house
	erb(:character, { locals: { character: character, house: house } })
end
