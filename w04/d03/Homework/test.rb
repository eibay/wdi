require 'httparty'
require 'json'
require 'pry'

	response = HTTParty.get("http://api.randomuser.me/")

			first_name = response["results"][0]["user"]["name"]["first"].capitalize
			last_name = response["results"][0]["user"]["name"]["last"].capitalize
			gender = response["results"][0]["user"]["gender"].capitalize
			city = response["results"][0]["user"]["location"]["city"].capitalize
			state = response["results"][0]["user"]["location"]["state"].capitalize

			puts first_name + last_name

	binding.pry