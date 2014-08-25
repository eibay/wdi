require 'json'
require 'pry'


patients = JSON.parse(File.read('./patients.txt'))

#binding.pry

puts "What condition are you looking for?"
condition_searched = gets.chomp.downcase

empty_test = 0
patients.each do | patient |
	if patient["condition"].downcase == condition_searched.downcase
			puts
			puts "Name: " + patient["first"] + " " + patient["last"]
			puts "Admitted: " + patient["admit_date"]
			puts
			empty_test += 1
	end
end

if empty_test == 0
	puts "We have no patients with that condition."
end


