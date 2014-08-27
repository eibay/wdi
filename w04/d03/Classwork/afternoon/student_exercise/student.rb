require 'json'
require 'pry'

puts "What is your first name?"
first_name = gets.chomp
puts "My name is #{first_name}."
puts "What is your last name?"
last_name = gets.chomp
puts "My last name is #{last_name}."
puts "What is your email address?"
email = gets.chomp
puts "My email address is #{email}."

student = ({:first_name first_name, :last_name last_name, :email email})
