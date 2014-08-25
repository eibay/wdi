require 'date'
require 'pry'
require 'json'



puts "Seattle Grace Hospital -- PATIENT ADMITTANCE"
puts
puts "Enter Patient First Name:"
first_name = gets.chomp
puts "Enter Patient Last Name:"
last_name = gets.chomp
puts "Enter Date of Admittance: MM/DD/YYYY format"
date_admitted = gets.chomp
date_admitted = Date.strptime(date_admitted, "%m/%d/%Y")
puts "Enter Patient condition: "
condition = gets.chomp

patient = {"first_name" => first_name, "last_name" => last_name, "date_admitted" => date_admitted, "condition" => condition}

file = JSON.parse(File.read('./patient_list.txt'))

file << patient

patient_json = JSON.generate(file)

File.write('./patient_list.txt', patient_json)
