require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'
require 'pry'

get '/' do
  erb(:main)

end

get '/city-pics' do 
  content_type :json

  lat = params[:lat]
  lng = params[:lng]
  url = URI.encode("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=4ad7cc36c172434588afd340aa74cd01")
  pictures = HTTParty.get(url)

  pictures.response.body

end

get '/tag-pics' do 
  content_type :json
  tag = params[:tag]
  url = URI.encode("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
  pictures = HTTParty.get(url)

  pictures.response.body

end

