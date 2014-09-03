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

	def greeting
		puts "Hello, my name is #{@first_name} #{@last_name} and I'm from #{@city}."
	end


	# binding.pry
	def self.random_user

		response = HTTParty.get("http://api.randomuser.me/")
		@first_name = response["results"][0]["user"]["name"]["first"].capitalize
		@last_name = response["results"][0]["user"]["name"]["last"].capitalize
		@gender = response["results"][0]["user"]["gender"].capitalize
		@city = response["results"][0]["user"]["location"]["city"].capitalize
		@state = response["results"][0]["user"]["location"]["state"].capitalize

		return User.new({first_name: first_name, last:last, gender:gender, city:city, state:state})

	end

end
