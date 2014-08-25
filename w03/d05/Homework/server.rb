require 'pry'
require 'json'

puts "Welcome to Seattle Grace Hospital. Please follow the prompts:"

puts "What the patient's first name?"
patient_first_name = gets.chomp

puts "What patient's last name?"
patient_last_name = gets.chomp

puts "Date of admittance:"
date = gets.chomp

puts "Condition of patient"
patient_condition = gets.chomp

patient_hash = {"patient_first_name" => patient_first_name, "patient_last_name" =>patient_last_name, "date" => date, "patient_condition" => patient_condition}

patients = JSON.parse(File.read('./patient2.txt'))
patients << patient_hash

File.write('./patient2.txt', patients.to_json)

