
require 'faker'
require 'pry'

# Person {:id => {:name => "Amy", :phone => "555-222-3333" }}


class Person
	def initialize(name, phone)
		@name = name
		@phone = phone
	end
end

persons_1000 = {}

x = 1
while x < 1001
	name = Faker::Name.name
	phone = Faker::PhoneNumber.phone_number

	person = Person.new(name, phone)

	users[x] = person
	x += 1
end

binding.pry

# question: how can I get better at googling and reading documention

# alternate way below with syntactic sugar

1.upto(1000) do |num|
	name = Faker::Name.name
	phone = Faker::PhoneNumber.phone_number

	person = Person.new(name, phone)

	users[num] = person
end