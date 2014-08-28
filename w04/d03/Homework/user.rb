require 'pry'

random_users = []

class User

	def initialize (attributes)
		# @first_name = attributes[:first_name]
		# @last_name = attributes[:last_name]
		# @gender = attributes[:gender]
		# @city = attributes[:city]
		# @state = attributes[:state]
		@attributes = attributes
	end

	def greeting
		# puts "Hello, my name is #{@first_name} #{@last_name} and I'm from #{@city}."
		puts "Hello, my name is #{@attributes[:first_name]} #{@attributes[:last_name} and I'm from #{attributes[:@city]}."

	end

	#Brackets Method

	def [](key)
		@attributes[key]
	end

	def self.random_user
		
	response = HTTParty.get("http://api.randomuser.me/")

			@first_name = response["results"][0]["user"]["name"]["first"].capitalize
			@last_name = response["results"][0]["user"]["name"]["last"].capitalize
			@gender = response["results"][0]["user"]["gender"].capitalize
			@city = response["results"][0]["user"]["location"]["city"].capitalize
			@state = response["results"][0]["user"]["location"]["state"].capitalize

		return { 
			first_name: @first_name, 
			last_name: @last_name, 
			gender: @gender, 
			city: @city, 
			state: @state} 
	end

	def getInfo 
		return @attributes
	end

end