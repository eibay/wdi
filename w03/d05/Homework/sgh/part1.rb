require 'json'
require 'pry'



puts "What is your first name?"
first_name = gets.chomp.capitalize

puts "What is your last name?"
last_name = gets.chomp.capitalize

puts "What was your date of admittance?"
date = gets.chomp.to_s

puts "What is your condition?"
condition = gets.chomp.capitalize

hash = {first_name: first_name, last_name: last_name, date: date, condition: condition}

patients = JSON.parse(File.read('./patients.txt'))
patients << hash

File.write('./patients.txt', patients.to_json)