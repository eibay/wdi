# Create a User class with the attributes - first_name, last_name, gender, city, state
# Add an instance method called greeting
# It should have the instance "introduce" itself by returning it's full name and city
# Add a class method random_user that makes a HTTP request to http://randomuser.me/
# HINT:
# ``` HTTParty.get("http://api.randomuser.me/'")
# - The method should return the hash

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
    "Hi, my name is #{@first_name} #{@last_name}, I'm #{@gender} and I'm from #{@city} #{@state}."
  end

  def self.random_user
   api_call = HTTParty.get("http://api.randomuser.me")
   user = api_call["results"][0]["user"]
   first_name = user["name"]["first"]
   last_name = user["name"]["last"]
   gender = user["gender"]
   city = user["location"]["city"]
   state = user["location"]["state"]
   User.new(first_name, last_name, gender, city, state)
   api_call
  end
end

howdy = User.new("Timoor", "Kurdi", "male", "Rego Park", "NYC")
puts howdy.greeting

