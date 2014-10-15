# Create a hash with 1000 Person objects that have junk data.
# the keys in the hash should be a number, similar to an id(auto-increment this)
# the values in the hash should be a Person object(class object) objects are instances of classes, a class of your own creation not one that ruby comes with
# Each Person object should have the below attributes
# name
# phone number
# Use the faker gem to generate the junk data

# require 'faker'

# class Name
# end

# class Phone
# end

# name = Faker::Name.name
# phone = Faker::PhoneNumber.phone_number

# persons = {1 => "name", 2 => "phone"}

# var name = 0;
# var phone = 0;

# while name < 1001 && phone < 1001 do
# 	puts("we in the loop")

# end

require 'faker'
require 'pry'

class Person

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number
	end

end

users = Hash.new

# users = {}

# x = 1

# while x < 1001

# 	name = Faker::Name.name
# 	phone = Faker::PhoneNumber.phone_number

# 	person = Person.new(name, phone)

# 	users[x] = person

# 	x+=1

# end

1.upto(1000) do |num|
	
	name = Faker::Name.name
	phone = Faker::PhoneNumber.phone_number

	person = Person.new(name, phone)

	users[num] = person

end

binding.pry