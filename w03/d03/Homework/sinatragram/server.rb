require 'sinatra'
require 'pry'


get ("/") do
	erb(:index)	
end

binding.pry

get ("/name") do
end

get("/search_results") do
  tag = request.params["tag"]
  api_result = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=267f9747893548ab86d79baff64cb209")
  erb(:search_results, { locals: { tag: api_result } })
end

