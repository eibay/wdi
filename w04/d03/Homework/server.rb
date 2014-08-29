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

binding.pry
	def self.random_user()
		api = HTTParty.get("http://api.randomuser.me/")   
		first_name = api["results"][0]["user"]["name"]["first"] 
		last_name = api["results"][0]["user"]["name"]["last"] 
		city = api["results"][0]["user"]["location"]["city"]  
		state = api["results"][0]["user"]["location"]["state"] 

		return User.new({ first_name: first, last_name: last, city: city, state: state})
	end
end
########################################################
#alternate way

class User

	def initialize (hash)
		@attributes = hash
	end

	def greeting ()
		puts "Hi I am #{@attributes[:first_name]} #{@attributes[:last_name]}, hailing from #{@attributes[:city]}."
	end

	def [](key)
		retrurn @attributes[key]

	def self.random_user()
		random_user = HTTParty.get("http://api.randomuser.me/")   
		random_user_info= random_user["results"][0]["user"]

	randonm_hash {
		first_name = random_user_info["name"]["first"] 
		last_name = random_user_info["name"]["last"] 
		city = random_user_info["location"]["city"]  
		state = random_user_info["location"]["state"] 
		}



