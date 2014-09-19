require 'sinatra'
require 'pry'
require 'httparty'
require 'URI'

get ("/") do
  erb(:index)
  # can do file.read if dont want erb file
end


# get ("/titles") do
#   url = URI.encode("http://www.omdbapi.com/?t=#{params[:title]}")
#   movie = HTTParty.get(url)
#   movie.response.body
# end
#  
#if using ruby do this