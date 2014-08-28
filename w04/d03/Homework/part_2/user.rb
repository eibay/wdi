require 'httparty'
require 'pry'

class User

	def initialize(first_name, last_name, gender, city, state)
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@city = city
		@state = state
    end

    def greeting
    	puts "Hello I'm #{@first_name} #{@last_name} from #{@city}."
    end

    def self.find(random_user)
    url = "http://api.randomuser.me/" + user
    response = HTTParty.get(url)
    return response['first']['last']['gender']['city']['state']
    end

  end






