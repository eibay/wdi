require 'json'
require 'pry'

all_patients = JSON.parse(File.read("patients.txt"))

puts "\nWelcome to Seattle Grace Hospital."
puts "\nSearch for patient by condition."
print "Condition: "
condition = gets.chomp

puts "\nPatients with #{condition}:\n"

all_patients.each do |patient|
	if patient["condition"] == condition
		puts "#{patient["first"]} #{patient["last"]} admitted #{patient["date"]}"
	end
end