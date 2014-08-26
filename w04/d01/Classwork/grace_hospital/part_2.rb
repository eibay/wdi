

# Objective: Create a command line application to search for patients by condition

# Spec:
# Your application should ask the user for a single condition
# All patients with that condition should be printed to the terminal, 
# including their First Name, Last Name, and Date of Admittance

require "json"
require "pry"



patient_directory = JSON.parse(File.read("./patient_directory.txt"))


puts "Welcome to the Grace Hospital patient tracker. Please gimme the condition you're searching for."

query_condition = gets.chomp 

patient_directory.each do |patient|
	if  query_condition == patient["condition"]
		puts "Patient: #{patient['first']} #{patient['last']}. Date of Admittance: #{patient['date']}."
	end
end





