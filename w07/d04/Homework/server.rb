require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'
require 'pry'

get ("/")do
	erb(:index)
end

get("/images") do
	content_type :json

  	search = params[:search]
	url = URI.encode("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f")
	instagram = HTTParty.get(url)
	# instagram = instagram_to.json
	instagram.response.body
	# erb(:index)
end