require 'pry'
require 'json'



puts "What is your first name?"
first = gets.chomp.capitalize

puts "What is your last name?"
last = gets.chomp.capitalize

puts "Date of admission mm:dd:yy?"
date = gets.chomp

puts "What condition do you have?"
condition = gets.chomp.capitalize

person = {"first" => first, "last" => last, "date" => date, "condition" => condition}

patients = JSON.parse(File.read('./patient.txt'))
patients << person
File.write('./patient.txt', patients.to_json)



