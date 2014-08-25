require 'json'
require 'pry'

puts "Condition?"

condition_search = gets.chomp

patients = JSON.parse(File.read('./patients.txt'))

patients.each do |patient|

	if patient["condition"] == condition_search
		puts "#{patient["first"]} #{patient["last"]} (#{patient["date"]})"
	
	else
		puts "No patient with the same condition found"

	end

end
