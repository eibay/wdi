require 'httparty'
require 'pry'

class User

	def initialize (attr)
		@first_name = attr(first_name)
		@last_name = attr(last_name)
		@gender = attr(gender)
		@city = attr(city)
		@state = attr(state)
	end

	def greeting
		puts "Hi I am #{first_name} #{last_name}, hailing from #{city}."
	end

########################################################
# [13] Pry(main)> api["results"][0]["user"]["name"]["first"]                                                                                                                                                         
# "beth"
# [14] Pry(main)> api["results"][0]["user"]["name"]["first"]                                                                                                                                                          
# "frazier"
# [15] Pry(main)> api["results"][0]["user"]["location"]["city"]                                                                                                                                                      
# "van alstyne"
# [16] Pry(main)> api["results"][0]["user"]["location"]["state"]                                                                                                                                                     
# "iawaii"
########################################################

	def self.random_user()
		api = HTTParty.get("http://api.randomuser.me/")   
		first_name = api["results"][0]["user"]["name"]["first"] 
		last_name = api["results"][0]["user"]["name"]["last"] 
		city = api["results"][0]["user"]["location"]["city"]  
		state = api["results"][0]["user"]["location"]["state"] 

		return User.new({ first_name:first, last_name: last, city: city, state: state})
	end
end
# binding.pry