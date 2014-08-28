require 'pry'
require 'httparty'

class User

	def initialize(first_name, last_name, gender, city, state)
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@city = city
		@state = state
	end


	def greeting
		return "Hello, I'm #{@first_name} #{@last_name} from #{@city}"
	end


	def self.random_user
		return HTTParty.get("http://api.randomuser.me/")
	end



end


random = User.random_user["results"][0]["user"]

random_instance = User.new(random["name"]["first"], random["name"]["last"], random["gender"], random["location"]["city"], random["location"]["state"])

puts random_instance.greeting
