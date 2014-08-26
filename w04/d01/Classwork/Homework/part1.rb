require 'json'
require 'pry'


puts "First name:"
first_response = gets.chomp.capitalize

puts "Last name:"
last_response= gets.chomp.capitalize

puts "Date:"
date_response=gets.chomp

puts "Condition:"
condition_response = gets.chomp

patient = {"first" => first_response, "last" => last_response, "date" => date_response, "condition" => condition_response}

patients = JSON.parse(File.read('./patients.txt'))

patients.push(patient)

File.write('./patients.txt', patients.to_json)