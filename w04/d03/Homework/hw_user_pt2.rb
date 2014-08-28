require_relative './user'
#call on class User
require 'pry'

users = []
#users set to empty array

user = User.random_user

users << User.new(user)
#calls on the class User and pushes everything random_user method 


users.greeting
#invokes the greeting instance method for users
