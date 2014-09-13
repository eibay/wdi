require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'json'
require_relative './lib/connection'
require_relative './lib/band'

after do 
	ActiveRecord::Base.connection.close
end

# List 5 bands at a time (come from API in JSON)
# Have button that creates a new random band and then redirects to that band's page
# Each listed band should have a link to their page

get("/") do
	bands = HTTParty.get("http://127.0.0.1:2000/")

	erb(:index, { locals: { bands: bands } })
end

# post("/band/create") do


# 	erb(:index)
# end

# House.create({
#   name: "Lannister", 
#   sigil_url: "http://img1.wikia.nocookie.net/__cb20140402110342/gameofthrones/images/thumb/0/0b/House-Lannister-heraldry.jpg/250px-House-Lannister-heraldry.webp",
#   region: "The Westerlands"
# })