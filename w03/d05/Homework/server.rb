
require 'json'
require 'pry'


puts "First name?"

first=gets.chomp

puts "Last name?"

last=gets.chomp

puts "Date of Admission?"

admission=gets.chomp

puts "Condition?"

condition=gets.chomp

patient={"first" => first, "last" => last, "admission" => admission , "conditon" => condition}

patients=JSON.parse(File.read("public/patients.txt"))

patients.push(patient)

File.write("public/patients.txt", patients.to_json)
