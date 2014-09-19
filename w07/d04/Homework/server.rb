require 'sinatra'
require 'json'
require 'httparty'

get "/" do

content_type :json

tag = params[:tag]

url = URI.encode("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

images = HTTParty.get(url)

images.response.body

end