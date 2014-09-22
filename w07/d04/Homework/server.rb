require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

get("/") do 
	erb(:index)
end

# get("/") do
# 	tag = request.params["search"]
# 	latitude = request.params["latitude"].to_f
# 	longitude = request.params["longitude"].to_f

# 	instagram_tag = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
# 	instagram_location = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

# 	erb(:index, { locals: {tag: tag, instagram_tag: instagram_tag, instagram_location: instagram_location } })

# end


# erb(:index, { locals: { instagram_api: instagram_api } })

get ("/search") do
  content_type :json
  tag = params["search"]
  url = URI.encode("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
  instagram_api = HTTParty.get(url)
  instagram_api.response.body
end