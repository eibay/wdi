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
	# api_bands = HTTParty.get("http://127.0.0.1:2000/")

	erb(:index, { locals: { bands: Band.all() } })
end

get("/band/create") do
	api_band = HTTParty.get("http://127.0.0.1:2000/band/create")
	erb(:band, { locals: { ape_band: api_band } })
# binding.pry
end


