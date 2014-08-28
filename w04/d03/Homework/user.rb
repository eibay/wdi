require 'httparty'
require 'pry'

class User

	def initialize(attr)
		@first_name = attr[:first_name]
		@last_name = attr[:last_name]
		@gender = attr[:gender]
		@city = attr[:city]
		@state = attr[:state]

	end

	def greeting(first_name, last_name, city)
		return "Hello, human - my name is #{@first_name} #{@last_name} and I'm from #{@city}."
	end

	def self.random_user()
		random_user = HTTParty.get("http://api.randomuser.me/'")
		
		@first_name = random_user["results"][0]["user"]["name"]["first"].capitalize
		@last_name = random_user["results"][0]["user"]["name"]["last"].capitalize
		@gender = random_user["results"][0]["user"]["gender"].capitalize
		@city = random_user["results"][0]["user"]["location"]["city"].capitalize
		@state = random_user["results"][0]["user"]["location"]["state"].capitalize
		

		return "My name is #{first_name} #{last_name} and I'm from #{city}."


	end
end