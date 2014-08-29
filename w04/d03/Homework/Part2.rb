require 'HTTParty'
require 'pry'
class User
	def initialize(attributes)
		@first_name = attributes["first_name"]
		@last_name = attributes["last_name"]
		@gender = attributes["gender"]
		@city = attributes["city"]
		@state = attributes["state"]
	end 

	def greeting
		return "Hi! I'm #{@first_name} #{@last_name} from #{@city}, #{@state}."
	end 

	def self.randomUser
		rando = HTTParty.get("http://api.randomuser.me/") 
		rando_gender = rando["results"][0]["user"]["gender"]
		rando_first = rando["results"][0]["user"]["name"]["first"]
		rando_last = rando["results"][0]["user"]["name"]["last"]
		rando_city = rando["results"][0]["user"]["location"]["city"]
		rando_state = rando["results"][0]["user"]["location"]["state"]
		new_user = {"first_name" => rando_first, "last_name" => rando_last, "gender" => rando_gender, "city" => rando_city, "state" => rando_state}
		return User.new(new_user)
	end
end 

students = []

student1 = User.new("first_name" => "Tess", "last_name" => "Shapiro", "gender" => "female", "city" => "St.Louis", "state" => "MO")
student2 = User.new("first_name" => "Joe", "last_name" => "Shmo", "gender" => "male", "city" => "NYC", "state" => "NY")
student3 = User.new("first_name" => "Jane", "last_name" => "Doe", "gender" => "female", "city" => "Pheonix", "state" => "AZ")



students.push(student1, student2, student3)

students.each do |a|
	puts a.greeting
end 

puts User.randomUser.greeting
