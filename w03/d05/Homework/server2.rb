require 'pry'
require 'json'

patients = JSON.parse(File.read('./patient2.txt'))

puts "What symptoms are you looking for?"
patient_condition = gets.chomp

patients.each do |patient|
	if patient["patient_condition"] == patient_condition
		puts "#{patient['patient_first_name']} #{patient['patient_last_name']}; admitted on #{patient['date']}"
end
end
