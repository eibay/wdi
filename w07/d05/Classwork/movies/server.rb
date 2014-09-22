require 'sinatra'
require 'httparty'
require 'json'
require 'sinatra/reloader'
require 'uri'

get '/' do 

  erb(:index)
end


get '/search' do 
  content_type :json

  search = params["search"]
  url = URI.encode("http://www.omdbapi.com/?t=#{search}")
  url_parsed = HTTParty.get(url)

  url_parsed.response.body 
end