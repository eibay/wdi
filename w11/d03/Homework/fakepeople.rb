require 'faker'
require 'pry'
people = {}

class Person
	def initialize(info)
		@name = info[:name]
		@phone_number = info[:phone_number]
	end
end

(1..1000).each do |person|
	new_person = Person.new({name: Faker::Name.name , phone_number: Faker::PhoneNumber.cell_phone})
	people[person] = new_person
end

print people

binding.pry