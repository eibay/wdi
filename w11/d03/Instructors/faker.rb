require 'faker'
require 'pry'

class Person

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number 
	end

end

users = Hash.new 

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