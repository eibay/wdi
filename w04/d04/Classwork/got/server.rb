require 'sinatra'
require 'sinatra/reloader'
require_relative './got_characters'
require_relative './got_houses'
require 'pry'

get ('/') do
	erb(:index)	
end

get('/characters') do
	erb(:characters, {locals: {characters: Character.all() } })
end

get('/character/:id') do
	character = Character.find_by("id", params["id"])
	house = House.select_by("house_id", house["id"]) 

	erb(:character, {locals: { character: character, house: house}})
end

get('/houses') do
	erb(:houses, {locals: {houses: House.all() } })
end

get('/house/:id') do
	house = House.find_by("id", params["id"])
	character = Character.find_by("id", params["id"])
	# character= Character.select_by("house_id", house["id"])
	
	erb(:house, {locals: { character: character, house: house}})
end