require 'httparty'

class User

	# def initialize(user_hash)
	# 	@first_name = user_hash[:first_name]
	# 	@last_name = user_hash[:last_name]
	# 	@gender = user_hash[:gender]
	# 	@city = user_hash[:city]
	# 	@state = user_hash[:state]
	# end

	def initialize(user_hash)
		@attributes = user_hash
	end

	def greeting
		puts "Hello. My name is #{@attributes[:first]}. I live in #{@attributes[:city]}."
	end

	def self.random_user
		response = HTTParty.get("http://api.randomuser.me")
		first = response["results"][0]["user"]["name"]["first"].capitalize
		last = response["results"][0]["user"]["name"]["last"].capitalize
		gender = response["results"][0]["user"]["gender"].capitalize
		city = response["results"][0]["user"]["location"]["city"].capitalize	
		state = response["results"][0]["user"]["location"]["state"].capitalize	
		new_hash = { 
			first_name: first, 
			last_name: last, 
			gender: gender, 
			city: city, 
			state: state 
		}
		User.new(new_hash)
	end

	def [](key)
		return @attributes[key]
	end

end








require_relative './user'
require 'pry'

users = []

# user = User.random_user

users << User.new(user)


users[0].greeting




