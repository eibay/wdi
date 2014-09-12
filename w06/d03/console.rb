require 'pry'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'
require 'json'

response = HTTParty.get("http://www.reddit.com")

puts JSON.parse(response)



# response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")