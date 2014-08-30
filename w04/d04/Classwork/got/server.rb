require 'sinatra'
require 'sinatra/reloader'
require 'pry'
# require_relative './lib/model.rb'
require_relative './lib/house.rb'
require_relative './lib/character.rb'

get "/" do 
	erb(:main)
end

get "/houses" do
	houses = House.all()
erb(:houses_page, {locals: { houses: houses}})
end 

get "/houses/:id" do
	house = House.find_by("id", params["id"])
	characters = house.find_characters

	erb(:house_info, {locals: { house: house, characters: characters}})
end

# Characters

get "/characters" do 
	erb(:characters_page, {locals: { characters: Character.all()}})
end

get "/characters/:id" do 
	character = Character.find_by("id", params["id"])
	house = character.find_house

	erb(:character_info, {locals: { character: character, house: house}})
end