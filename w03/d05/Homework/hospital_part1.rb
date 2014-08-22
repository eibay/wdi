require 'json'

all_patients = JSON.parse(File.read("patients.txt"))

patient = {}

puts "\nWelcome to Seattle Grace Hospital."
puts "\nPlease enter patient information."
print "First Name: "
first = gets.chomp
print "Last Name: "
last = gets.chomp
print "Date of Admittance: "
date = gets.chomp
print "Condition: "
condition = gets.chomp
puts "Thank you. Goodbye."

patient[:first] = first
patient[:last] = last
patient[:date] = date
patient[:condition] = condition

all_patients << patient

File.write("patients.txt", all_patients.to_json)