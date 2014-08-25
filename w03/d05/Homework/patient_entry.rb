require 'json'
require 'pry'


puts "Patients first name"
first_name = gets.chomp
puts
puts "Patients last name"
last_name = gets.chomp
puts
puts "Date of Admittence"
date_admit = gets.chomp
puts
puts "Patients Condition"
condition = gets.chomp
puts

patients = JSON.parse(File.read('./patients.txt'))
# JSON

patient = {"first" => first_name, "last" => last_name, "date_admit" => date_admit, "condition" => condition}

patients << patient

patients_json = JSON.generate(patients)

File.write('./patients.txt', patients_json)




# post("/patients") do
# 	first_name = params["first"]
# 	last_name = params["last"]
# 	date_admit = params["date"]
# 	condition = params["condit"]


# patients = JSON.parse(File.read('./patients.txt'))
# patients.push()


