require 'pry'
require 'json'

roster = JSON.parse(File.read("./data/patients.txt"))

puts "Enter patient's first name"
first_name = gets.chomp.downcase.capitalize

puts "Enter patient's last name"
last_name = gets.chomp.downcase.capitalize

puts "From what condition does the patient suffer?"
condition = gets.chomp.downcase

admitted = Time.now.strftime("%B %-d, %Y")

patient = {"first" => first_name, "last" => last_name, "condition" => condition, "admitted" => admitted, "doctor" => "none"}

roster.push(patient)

json_roster = JSON.generate(roster)

File.write("./data/patients.txt", json_roster)

puts "#{first_name} #{last_name} has been admitted on #{admitted} with a condition of #{condition}."