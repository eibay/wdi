require 'pry'
require 'json'

puts "which condition are you searching for?"
search = gets.chomp.downcase

patients = JSON.parse(File.read('./patients.txt'))

patients.each do |x|
	if x["condition"].include?(search)
		puts "It looks like #{x["fName"]} #{x["lName"]}, a patient of #{x["doc"]} and who was admitted on #{x["date"]}, matches your search."  
	end
end