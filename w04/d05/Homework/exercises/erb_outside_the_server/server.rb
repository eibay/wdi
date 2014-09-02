############################
###ERB outside the server###
############################

require 'json'
require 'httparty'
require 'sinatra'
require 'pry'

random_user = HTTParty.get('http://api.randomuser.me')

full_name = "#{random_user["results"][0]["user"]["name"]["first"]} #{random_user["results"][0]["user"]["name"]["last"]}"
city = random_user["results"][0]["user"]["location"]["city"]
state = random_user["results"][0]["user"]["location"]["state"]

person = {full_name:full_name, city:city, state:state}

get('/') do
	erb(:index, { locals: {full_name:full_name, city: city, state:state }})
end