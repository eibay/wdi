require 'JSON'
require 'pry'

patients = JSON.parse(File.read("./patients.txt"))
binding.pry

puts "What is your first name?"

first_name = gets.chomp

puts "What is your last name?"

last_name = gets.chomp

puts "What is your medical condition?"

condition = gets.chomp

date_of_admittance = Time.now 


patients << {first: first_name, last: last_name, condition: condition, date: date_of_admittance}

File.write("./patients.txt", patients.to_json)

puts patients
puts "Thank you, you have been added to our database"
