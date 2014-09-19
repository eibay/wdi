require 'httparty'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'uri'
require 'pry'



get '/' do
  erb(:index)
end

get '/monkey' do 
  
  search = params["search"]
  url = URI.encode("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=f9f86dbac5d7478c8e325fb20ea506b1")
  api = HTTParty.get(url)
  api.response.body

end