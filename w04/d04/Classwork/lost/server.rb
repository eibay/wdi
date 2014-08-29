require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/home'
require_relative './lib/char'

get("/") do
erb(:index)	
end

get("/characters") do
erb(:characters)
end

get("/characters/new") do 
erb(:newchar)
end

post("/new_char") do 
	new_guy = {"name" => params["name"], "url" => params["url"], "home" => params["home"]}
	Char.create(new_guy)
erb(:characters)
end

get("/characters/:id") do 
	char = Char.find_by("id", params[:id])
	home = Home.find_by("id", )
erb(:character, locals: {char: char, home: home})
end