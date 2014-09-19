require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'uri'

get("/") do
  erb(:index)
end

get '/images' do

    content_type :json

    movie_title = params[:movie_title]

    url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")

    movie = HTTParty.get(url)

    movie.response.body

    erb(:index)
end