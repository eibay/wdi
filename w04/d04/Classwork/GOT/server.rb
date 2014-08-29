require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './character'
require_relative './house'

get '/' do
	houses = House.all
	characters= Character.all
	erb(:index, {locals: {houses: houses, characters: characters}})
end



get '/characters' do
	houses = House.all
	characters= Character.all
	erb(:characters, {locals: {houses: houses, characters: characters}})
end



post '/characters' do
	character = { 
		first: params["first"], 
		last: params["last"], 
		house_id: params["house_id"]
	}

	Character.create(character)
	characters = Character.all
	erb(:characters, {locals: {characters: characters, houses: houses}})

end


get '/characters/:id' do
	id = params["id"]
	character=Character.find_by("id", id)
	house = character.house
	
	erb(:character, {locals: {character: character, house: house}})
end

get '/houses/:id' do
	house_id = params["id"]
	house = House.find_by("id", house_id)
	
	characters = house.characters
	
	erb(:houses, {locals: {house: house, characters: characters}})
end





