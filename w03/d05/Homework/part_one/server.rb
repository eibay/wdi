## Part 1 ##

require 'json'
require 'pry'

person = {}

puts "What is your first name?"
firstname = gets.chomp
puts "What is your last name?"
lastname = gets.chomp
puts "When did you admit?"
admittance_date = gets.chomp
puts "Condition?"
condition = gets.chomp

person[:firstname] = first_name
person[:lastname] = last_name
person[:admittance_date] = admittance_date
person[:condition] = condition

patients = JSON.parse(File.read('../patients.txt'))
patients << person
patients_json = JSON.generate(patients)
File.write('../patients.txt', patients_json)