require 'pry'
require 'JSON'

puts "Search a specific patient by condition"
puts "Type a specific condition and we will check our data base for a patient with the given condition"

condition = gets.chomp

patients = JSON.parse(File.read('./patientinfo.txt'))

patients.each do |a|
	if a["condition"].include? condition
		puts a["first"]
		puts a["last"]
		puts a["date"]
	end
end

puts "Thank you for using our search engine"
