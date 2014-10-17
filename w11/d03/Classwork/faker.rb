require 'faker'
require 'pry'

class Person
	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number   
	end
end

# people = {}
# hash literal

people = Hash.new

# x = 1
# while x < 1001

# 	name = Faker::Name.name
# 	phone_number = Faker::PhoneNumber.phone_number

# 	new_person = Person.new(name, phone_number)

# 	people[x] = new_person
# 	x+=1
# end

1.upto(1000) do |num|
	name = Faker::Name.name
	phone_number = Faker::PhoneNumber.phone_number

	new_person = Person.new(name, phone_number)

	people[num] = new_person
end

binding.pry


