require 'json' #normally use to parse ruby hashes.
require 'pry'
require 'date'

puts "Welcome to Seattle Grace Hospital." 

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Welcome to Seattle Grace Hospital, #{first_name} #{last_name}."

puts "Please tell me, what is your condition?"
condition = gets.chomp
puts "Sorry to hear that you are experiencing #{condition}." 
puts "We are going to help you get better."

patient = {first: first_name, last: last_name, date_time_admittance: Date.today, condition: condition}

patients = JSON.parse(File.read('./patients.txt'))
patients.push(patient)
patients_json = JSON.generate(patients)
File.open('./patients.txt', 'w') do |f|
	f.puts(patients_json)
end