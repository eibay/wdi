require 'httparty'
require 'pry'

hash = {}

rand_user = HTTParty.get("http://api.randomuser.me/")

user = rand_user["results"][0]["user"]

first_name = user["name"]["first"].capitalize
last_name = user["name"]["last"].capitalize
city = user["location"]["city"].capitalize
state = user["location"]["state"].capitalize

hash["full_name"] = first_name + ' ' + last_name
hash["city"] = city
hash["state"] = state

binding.pry
erb(:erb, {locals: { full_name: hash["full_name"], city: hash["city"], state: hash["state"]}})

