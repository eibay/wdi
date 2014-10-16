require 'pry'
require 'date'
require 'faker'
require_relative './lib/connection'
require_relative './lib/user'

User.delete_all



  User.create({
    email: "asmith@yahoo.com",
    password: "128tttthhhh",
    balance: 1000
  })


# 1.upto(10) do |num|

#   User.create({
#     email: FFaker::Internet.email,
#     password: Faker::Internet.password,
#     balance: 1000
#   })

# end




  
