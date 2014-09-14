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

post("/band/create") do
	api_band = HTTParty.get("http://127.0.0.1:2000/band/create")
	api_band = JSON.parse(api_band)
	bands = Band.all
# ***** if api_band is included already in database, get a different one
		band_hash = {
		name: api_band["name"],
		genre: api_band["genre"],
		location: api_band["location"]
	}

	Band.create(band_hash)
	band = Band.find_by({name: api_band["name"]})

	erb(:band, { locals: { band: band, bands: Band.all() } })
end

# how do I create dynamic http request? *****
# get("band/:id") do
# binding.pry
# 	id = params[:id]
# 	api_band = HTTParty.get("http://127.0.0.1:2000/band/#{id}")
# 	api_band = JSON.parse(api_band)

# 		band = {
# 		name: api_band["name"],
# 		genre: api_band["genre"],
# 		location: api_band["location"]
# 	}

# 	erb(:band, { locals: { band: band, bands: Band.all() } })

# end





