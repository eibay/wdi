# create a hash with 1000 person object that have junk data
	# the keys in the hash should be a number
	# the values in the hash should be a person object

	# each person object should have the below attributes
		# name
		# phone number
require 'faker'

class Person

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number
	end

end

fake_data_hash = {}
i = 0

1000.times do |x| 
	person = Person.new(Faker::Name.name, Faker::PhoneNumber.phone_number)
	fake_data_hash[i] = person
	i += 1
end

puts fake_data_hash


# for in 0..1000
# 	person = Person.new(Faker::Name.name, Faker::PhoneNumber.phone_number)
# 	fake_data_hash[i] = person
# 	i += 1
# end

# puts fake_data_hash


# while i < 1000

# 	name = Faker::Name.name
# 	phone_number = Faker::PhoneNumber.phone_number

# 	person = Person.new(name,phone_number)

# 	users[i] = person

# 	x +=1
# end

# binding.pry


