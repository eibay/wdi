require 'json'
require 'pry'

all_patients = JSON.parse(File.read("patients.txt"))

puts "\nSearch patient by condition."
print "condition: "
condition = gets.chomp

puts "\n Patients with #{condition}:\n"

all_patients.each do |patient|
	if patient["condition"] == condition
		puts "#{patient["first"]} #{patient["last"]} #{patient["date"]}"
	end
end