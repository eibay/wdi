require 'httparty'

class Taxi 
	attr_accessor :driver_name, :city, :color

	def initialize driver_name, city, color
		@driver_name = driver_name
		@city = city 
		@color = color 
	end 

	# cuteness # 
	def drive 
		"Beep Beep Beep Beep, Yeah!" 
	end 

	def return_attr_to_terminal_as_a_string  
		"#{self.driver_name.capitalize} is like totally driving me thru #{self.city} & I'm, like, all #{self.color} & stuff."
	end 

end 

class User 

	attr_accessor :first_name, :last_name, :gender, :city, :state

	def initialize first_name, last_name, gender, city, state 
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@city = city
		@state = state 
	end 

	def self.random_user 
		# query random user db 
		random_user_url = "http://api.randomuser.me/" 
		response = HTTParty.get random_user_url

		# get the relevant results 
		g = response["results"][0]["user"]["gender"]
		f = response["results"][0]["user"]["name"]["first"]
		l = response["results"][0]["user"]["name"]["last"]
		c = response["results"][0]["user"]["location"]["city"]
		s = response["results"][0]["user"]["location"]["state"]

		# return a random user 
		User.new f, l, g, c, s 
	end 

	# more cuteness # 
	def introduce_the_self 
		"Hi, I'm #{self.first_name} of the #{self.last_name} clan. We hail from #{self.city}, #{self.state}, where nobody takes themselves very seriously."
	end 

	def greeting 
		"Hi, I'm #{self.first_name} of the #{self.last_name} clan. We hail from #{self.city}, #{self.state}, where everybody takes themselves incredibly seriously."
	end 
end 

