require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './characters'
require_relative './house'


get("/") do
	erb(:index)
end

get("/characters") do
	characters = Character.all()
	erb(:characters, {locals: {characters: characters}})
end

get("/houses") do
	houses = House.all()
	erb(:houses, {locals: {houses: houses } } )
end

get("/character/:id") do
	result = Character.find_by("name", params["id"])
	binding.pry
	erb(:character, {locals: {result: result} } )
end 

get("/characters/new") do
	houses = House.all()
	erb(:new_character, {locals: {houses: houses} } ) 
end