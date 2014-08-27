require 'httparty'

# open string class ASCII color codes *WHAAAHOOO* # 
class String

	def serious 
		# black on white, very proper   
		"\033[47;30m" + self + "\033[0m"
	end 

	def funny  
		# yellow on purple, because because 
		"\033[1;34;45m" + self + "\033[0m"
	end 
end 


# the taxi class # 
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

# the user class # 
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
		g = response["results"][0]["user"]["gender"].capitalize
		f = response["results"][0]["user"]["name"]["first"].capitalize
		l = response["results"][0]["user"]["name"]["last"].capitalize
		c = response["results"][0]["user"]["location"]["city"].split.each(&:capitalize!).join ' ' 
		s = response["results"][0]["user"]["location"]["state"].split.each(&:capitalize!).join ' '

		# return a random user 
		User.new f, l, g, c, s 
	end 
 
	def introduce_the_self 
		"Hi, I'm #{self.first_name} of the #{self.last_name} clan. We hail from #{self.city}, #{self.state}, where nobody takes themselves very seriously.".funny 
	end 

	def greeting 
		"Hi, I'm #{self.first_name} of the #{self.last_name} clan. We hail from #{self.city}, #{self.state}, where everybody takes themselves incredibly seriously.".serious 
	end 
end 

# the march of the random users # 
userland = []

150.times do 
	userland << [User.random_user, User.random_user]
end 

userland.each do |users_marching_hand_in_hand|
	left = users_marching_hand_in_hand[0]
	right = users_marching_hand_in_hand[1]
	puts left.introduce_the_self 
	puts right.greeting 
end 
