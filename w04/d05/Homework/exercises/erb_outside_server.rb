require 'httparty'
require 'erb'
require 'pry'

response = HTTParty.get("http://api.randomuser.me/")

first_name = response["results"][0]["user"]["name"]["first"].capitalize
last_name = response["results"][0]["user"]["name"]["last"].capitalize
full_name = first_name + " " + last_name
city = response["results"][0]["user"]["location"]["city"].capitalize
state = response["results"][0]["user"]["location"]["state"].capitalize

erb_template = "This awesome person is named <%= full_name %>. They live in <%= city %>, <%= state %>."

output = ERB.new(erb_template)
sentence = output.result()
puts sentence