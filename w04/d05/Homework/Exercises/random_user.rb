require 'pry'
require 'httparty'

response = HTTParty.get("http://api.randomuser.me/")

hash = {}

first = response["results"][0]["user"]["name"]["first"].capitalize

last = response["results"][0]["user"]["name"]["last"].capitalize

hash[:fullname] = first + " " + last

hash[:city] = response["results"][0]["user"]["location"]["city"].capitalize

hash[:state] = response["results"][0]["user"]["location"]["state"].capitalize

puts hash