require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'
require 'json'
require_relative './lib/connection'
require_relative './lib/character'

after do 
	ActiveRecord::Base.connection.close
end

get("/") do
  response = HTTParty.get("http://127.0.0.1:2000/")
  characters = JSON.parse(response)
	erb(:index, { locals: { characters: Character.all() } })
end

post("user/create") do

	end

get("user/:user_id") do

end

