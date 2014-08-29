require_relative "./house"
require_relative "./character"
require "sinatra"
require "sinatra/reloader"
require "pry"
require "json"

get "/" do
	erb(:index)
end

get "/characters" do
	erb(:characters, locals: {list: Character.all})
end

get "/houses" do
	erb(:houses, locals: {list: House.all})
end

get "/characters/new" do
	erb(:add_character, locals: {list: House.all})
end

get "/characters/:id" do
	char = Character.find_by("id", params["id"])
	house = House.find_by("id", char["house_id"])
	erb(:character, locals: {char: char, house: house})
end

get "/houses/:id" do
	house = House.find_by("id", params["id"])
	chars = Character.select_by("house_id", params["id"])
	erb(:house, locals: {list: chars, house: house})
end

post "/characters/new" do
	char = {
		"name" => params["name"],
		"img_url" => params["img_url"],
		"house_id" => params["house_id"]
	}
	Character.create(char)
	erb(:characters, locals: {list: Character.all})
end