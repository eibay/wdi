require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/house'
require_relative './lib/character'



get('/') do
	erb(:index)	
end

get('/characters') do
	characters = Character.all()

	erb(:characters, { locals: { characters: characters }})
end

get('/houses') do
	houses = House.all()
	erb(:houses, { locals: { houses: houses }})
end

get('/characters/new') do
	erb(:create)
end

get('/characters/:id') do
	character = Character.find_by("id", params["id"])
	erb(:character, { locals: { character: character }})
end

get('/houses/:id') do
	house = House.find_by("id", params["id"])
	erb(:house, { locals: { house: house }})
end

post('/characters/create') do
	name = params["name"]
	img = params["img"]
	house = params["house"]
	Character.create({name:"#{name}", img:"#{img}", house_id: House.find_by("name", "#{house}")["id"]})
	characters = Character.all()
	
	erb(:characters, { locals: { characters: characters }})
end







