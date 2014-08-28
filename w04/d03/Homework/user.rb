require 'httparty'
require 'pry'

class User

	def initialize(attributes)
		@first_name = attributes[:first]
		@last_name = attributes[:last]
		@gender = attributes[:gender]
		@city = attributes[:city]
		@state = attributes[:state]
	end

	def greeting
		puts "Hi! I'm #{@first_name} #{@last_name} from #{@city}, #{@state}"
	end

	def self.random_user
		user = HTTParty.get("http://api.randomuser.me/")
		first = user['results'][0]['user']['name']['first'].capitalize
		last = user['results'][0]['user']['name']['last'].capitalize
		gender = user['results'][0]['user']['gender'].capitalize
		city = user['results'][0]['user']['location']['city'].capitalize
		state = user['results'][0]['user']['location']['state'].capitalize 

		new_user = User.new({first: first, last: last, gender: gender, city: city, state: state})
		return new_user
	end
end

User.random_user.greeting