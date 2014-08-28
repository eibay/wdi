require 'httparty'
require 'pry'
require_relative './user'

users = []
# -- Part 2 Class Method -- 
random_user = User.random_user


user1 = {first_name: "Shirley", last_name: "Levy", gender: "female", city: "Brooklyn", state: "NY" }
users << User.new(user1)

user2 = { first_name: "Madge", last_name: "Dargan", gender: "female", city: "Hoboken", state: "NJ" }
users << User.new(user2)

user3 = { first_name: "Jeff", last_name: "Waller", gender: "male", city: "Rutherford", state: "NJ" }
users << User.new(user3)

user4 = User.random_user
users << User.new(user4)

# -- Part 2 Instance Method -- 
users.each do |user|
	user.greeting
end



