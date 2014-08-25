require 'json'
require 'pry'

puts "Search patients by condition."
puts "Type condition here"

condition = gets.chomp.capitalize

patients = JSON.parse(File.read('./patients.txt'))

patients.each do |x|
	if x["condition"].include?(condition)
		puts "#{x['first_name']} appears to have #{x['condition']}."
	else
		puts "Sorry, no one here with #{condition}"
	end
	break
end
