require 'pry'
require 'JSON'

patients = JSON.parse(File.read("./patients.txt"))

puts "What is your first name?"

first_name = gets.chomp

puts "What is your last name?"

last_name = gets.chomp

puts "What condition do you have?"

disease = gets.chomp

puts "What is your date of admittance?"

date = gets.chomp

patients << {first_name: first_name, last_name: last_name, disease: disease, date: date}

File.write("./patients.txt", patients.to_json)

puts patients

puts "Thank you for choosing Seattle Grace Hospital, stay healthy!"