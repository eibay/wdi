## Part 1 ##

require 'json'
require 'pry'

list = []
person = {}

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "When did you admit?"
admittance_date = gets.chomp
puts "Condition?"
condition = gets.chomp

person[:first_name] = first_name
person[:last_name] = last_name
person[:admittance_date] = admittance_date
person[:condition] = condition

list << person

puts list
