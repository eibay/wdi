require 'pry'
require 'httparty'


class User

attr_accessor :first_name
attr_accessor :last_name
attr_accessor :gender
attr_accessor :city
attr_accessor :state

def initialize(attributes)
	@first_name=attributes[:first_name]
	@last_name=attributes[:last_name]
	@gender=attributes[:gender]
	@city=attributes[:city]
	@state=attributes[:state]
end

def greeting
	puts "Hi my name is #{@first_name} #{@last_name} and I'm from #{@city}"
end

def self.random_user

	api=HTTParty.get("http://api.randomuser.me/")
	first=api["results"][0]["user"]["name"]["first"]
	last=api["results"][0]["user"]["name"]["last"]
    gender=api["results"][0]["user"]["gender"]
	city=api["results"][0]["user"]["location"]["city"]
	state=api["results"][0]["user"]["location"]["state"]
	

	return User.new({first_name:first , last_name: last, gender: gender, city: city, state: state})
	
end
end
binding.pry


