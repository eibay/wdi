require 'faker'
require 'pry'

class Person
  def initialize(name, phone_number)
  @name = name
  @phone_number = phone_number
  end
end

users = {}

# x = 1

# # starting at 1 bc we dont want to have an id of 0

# while x < 1001
#   name = Faker::Name.name
#   phone = Faker::PhoneNumber.phone_number

#   person =  Person.new(name, phone)

#   users[x] = person

#    x+=1
# end

            #################################

# 1001.times do |num|

#   name = Faker::Name.name
#   phone = Faker::PhoneNumber.phone_number

#   person =  Person.new(name, phone)

#   users[num] = person

# end

           #################################

1.upto(1000) do |num|

  name = Faker::Name.name
  phone = Faker::PhoneNumber.phone_number

  person =  Person.new(name, phone)

  users[num] = person

end


# all three ways work, the while loop that is commented out and the .times way. and the upto way. Same concept.!!!!!!!
#The placeholders signify each element and incremented number in the upto and times method.

binding.pry




