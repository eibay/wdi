#this is just to test out the classes and their
#methods. You could have tested out the classes
#in the file in which they are in but developers
#usually don't do that

require_relative "./taxi"
require_relative "./user"

puts ""
puts "====== TESTING TAXI CLASS ========="
puts "creating first taxi ..."
taxi1 = Taxi.new("sean", "new york", "blanched almond")
taxi1.printAttributes

puts ""
puts "now creating another taxi ..."
taxi2 = Taxi.new("joe", "san diego", "neon pink")
taxi2.printAttributes

puts ""
puts "wait what was that taxi2 can you repeat that?"
taxi2.printAttributes

puts ""
puts "oh ok got it!"

puts ""
puts "====== TESTING USER CLASS ========="

#User.new takes **1** parameter, but we are
#writing out the attributes hash in place
user = User.new({"first" => "sean", "last" => "west",
      "gender" => "male", "city" => "berkeley heights",
      "state" => "new jersey"})

user.greeting
puts ""

#This is the **exact same** as the previously created user
#but this time we create the hash before calling User.new
info = {"first" => "sean", "last" => "west",
      "gender" => "male", "city" => "berkeley heights",
      "state" => "new jersey"}

user = User.new(info) #See... just one parameter
user.greeting
puts ""

#notice here how User.random_user does not return a user
#object but rather a hash, so the burdon of parsing the
#data in this hash is on the code that uses the User class
#from the outside (i.e. the code written in the following 3 lines)
user2 = User.random_user
first = user2["results"][0]["user"]["name"]["first"]
puts "Here is a random users name: " + first

puts ""

#here User.bonus_random_user completely parses the data
#coming from the randomuser api for us
#look at how much cleaner it is! Modularity is nice.
user3 = User.bonus_random_user
puts "And here is a fully created random user\'s greeting"
user3.greeting

puts ""
