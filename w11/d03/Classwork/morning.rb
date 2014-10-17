require 'faker'
require 'pry'


# class Person
#   def initialize
#      @name = Faker::Name.name
#      @phone = Faker::PhoneNumber.phone_number
#   end

#   def newRandomPerson
#    {name: @name, phone: @phone}
#   end
# end

# hash = {}

# i = 0
# while i < 1000
#   newPerson = Person.new
#   hash[i] = newPerson.newRandomPerson
#   i += 1
# end

# OR

class Person
  def initialize(name,phone_number)
    @name = name
    @phone_number = phone_number
  end
end

hash = {}

# i = 1
# while i < 1001
#   newPerson = Person.new(Faker::Name.name,Faker::PhoneNumber.phone_number)
#   hash[i] = newPerson
#   i += 1
# end

    #  999 => #<Person:0x007fa3a42ee6f0 @name="Caden Batz", @phone_number="508-798-0161 x999">,
    # 1000 => #<Person:0x007fa3a42e67e8 @name="Johanna Yost", @phone_number="1-482-742-8487">

1.upto(1000) do |variable|
  newPerson = Person.new(Faker::Name.name,Faker::PhoneNumber.phone_number)
  hash[variable] = newPerson 

  
end
#is inclusive
#variable in this is the number
