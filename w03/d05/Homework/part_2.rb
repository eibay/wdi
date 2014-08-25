require 'pry'
require 'json'

puts "Welcome to Seattle Grace Hospital. What is your condition?"
condition = gets.chomp.downcase

patient_info = JSON.parse(File.read('./patient_info.txt'))

	patient_info.each do |x|
		if  x["condition"].include?(condition)
			puts x["first"] + " " + x["last"] + " " + x["admittance"].to_s
		end
	end