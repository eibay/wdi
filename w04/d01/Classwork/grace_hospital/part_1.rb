require "json"
require "pry"

# Your command line app should ask the user for a first name, last name, date of admittance, and Condition
# The application should not loop, it should grab the user's input only once:
# You should persist data to the one file holding all patients information


puts "Welcome to Seattle Grace Hospital. Please give me the following patient information:"
puts "First name"
first = gets.chomp
puts "Last name"
last = gets.chomp
puts "Date of admittance"
date = gets.chomp
puts "Condition"
condition = gets.chomp

patient = {first: first, last: last, date: date, condition: condition}

patient_directory = JSON.parse(File.read("./patient_directory.txt"))

patient_directory << patient

File.write("./patient_directory.txt", patient_directory.to_json)