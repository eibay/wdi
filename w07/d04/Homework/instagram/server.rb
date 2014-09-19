require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'

# ruby gets the photos from instagram

get '/' do 

# for the time being, until i figure out how to make a button work
tag_name = 'grass'
response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag_name}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
	erb(:index, {locals: {response: response}})
end