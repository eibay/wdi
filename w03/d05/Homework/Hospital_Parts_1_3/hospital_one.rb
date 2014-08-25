require 'json'
require 'pry'


patients = JSON.parse(File.read('./patients.txt'))

puts "First name?"
first_name = gets.chomp

puts "Last name?"
last_name = gets.chomp

#puts "Date of Admittance?"
admit_date = Time.now.strftime("%m/%d/%Y")
# time = Time.now.strftime("%I:%M%P")

puts "What seems to be the problem?"
condition = gets.chomp

patient = {"first" => first_name, "last" => last_name, "admit_date" => admit_date, "condition" => condition}

patients << patient

patients_json = JSON.generate(patients)

File.write('./patients.txt', patients_json)

