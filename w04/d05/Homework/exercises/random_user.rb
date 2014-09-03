require 'httparty'
require 'pry'

response = HTTParty.get("http://api.randomuser.me/")

first_name = response["results"][0]["user"]["name"]["first"].capitalize
last_name = response["results"][0]["user"]["name"]["last"].capitalize
full_name = first_name + " " + last_name
city = response["results"][0]["user"]["location"]["city"].capitalize
state = response["results"][0]["user"]["location"]["state"].capitalize

info = {full_name: full_name, city: city, state: state}

puts info

