require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'

# ruby gets the photos from instagram

get '/' do 
tag_name = 'sunglasses'
response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag_name}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
	erb(:index, {locals: {response: response}})
end