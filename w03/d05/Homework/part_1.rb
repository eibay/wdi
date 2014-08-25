require 'pry'
require 'json'

puts "Welcome to Seattle Grace Hospital. What is your first name?"
first_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "Date of Admittance?"
date = gets.chomp

puts "What is your condition?"
condition = gets.chomp.downcase

patient_data = {"first" => first_name, "last"=> last_name, "admittance" => date, "condition" => condition}

patient_info = JSON.parse(File.read('./patient_info.txt'))

patient_info.push(patient_data)

patients_json = JSON.generate(patient_info)

File.write('./patient_info.txt', patients_json)