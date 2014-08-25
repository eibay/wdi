require 'pry'
require 'JSON'


puts "Welcome to Seattle Grace Hospital"

puts "Please fill out the following application for assistance"

puts "First Name"
first_name = gets.chomp

puts "Last Name"
last_name = gets.chomp


puts "Todays Date and Time is"
puts (Time.now.strftime("%d/%m/%Y %H:%M"))
date_of_admittance = Time.now.strftime("%d/%m/%Y %H:%M")

puts "What is your condition?"
condition = gets.chomp

puts "Thank you, we will assist you shortly and appreciate in advance for your patience"


patient = {"first" => first_name, "last" => last_name, "date" => date_of_admittance, "condition" => condition}


patients = JSON.parse(File.read('./patientinfo.txt'))
patients.push(patient)
patients_json = JSON.generate(patients)
patients.push(patient)
File.write('./patientinfo.txt', patients_json)
