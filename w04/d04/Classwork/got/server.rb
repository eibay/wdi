require 'sinatra'
require_relative "./lib/characters.rb"
require_relative "./lib/ships.rb"

get '/' do 

	erb "welcome"
end 

get "/characters" do 


	erb "characters", {locals: {characters: Character.all}}
end 

get "/characters/:id" do 

	character = Character.find_by_id params[:id]
	ship_name = Ship.find_by_id(character.ship_id).name 


	erb "character", {locals: {character: character, ship_name: ship_name}}
end 

get "/ships" do 

	erb "ships", {locals: {ships: Ship.all}}
end 

get "/ships/:id" do 

	ship_id = params[:id]

	ship = Ship.find_by_id ship_id  
	characters_on_ship = Character.find_all_by "ship_id", ship_id 

	erb "ship", {locals: {ship: ship, characters_on_ship: characters_on_ship}}
end 