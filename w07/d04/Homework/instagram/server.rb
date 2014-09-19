require 'sinatra'
require 'HTTParty'
require 'json'
require 'pry'
require 'uri'


get '/' do
  erb(:index)
end

get '/locations' do
  url = URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]}&key=AIzaSyDjXlSwYarWX-96BiVrAovpiFhmoU0D2H0")
  values = HTTParty.get(url)
  lat =  values["results"][0]["geometry"]["location"]["lat"]           
  lon =  values["results"][0]["geometry"]["location"]["lng"] 
  pictures = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lon}&client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
  pictures.response.body
end
