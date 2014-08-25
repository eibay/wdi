require 'json'
require 'pry'

puts "Enter Search Condition"
condition = gets.chomp

patients = JSON.parse(File.read('./patients.txt'))

# binding.pry

patients.each do |x|


	if condition == x["condition"]

		# puts "hello"

		puts "Name " + x["first"] + " " + x["last"]
		puts "Date of Admission " + x["date_admit"]
		puts "Condition of Patient" + x["condition"]
		# puts "Hello"
	end
end