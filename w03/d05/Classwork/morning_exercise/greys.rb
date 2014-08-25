require 'pry'
require 'json'

characters = File.read("greys.txt")

char_all = characters.split("\n")

char_arr = []

char_all.each do |char|
	parse = char.split(",")
	char_hash = {}
	char_hash[:actor] = parse[0]
	char_hash[:character] = parse[1]
	char_hash[:episodes] = parse[2].split(' ')[0]
	if parse[3].include?("-")
		char_hash[:start_year] = parse[3].split("-")[0].to_i
		char_hash[:end_year] = parse[3].split("-")[1].to_i
	else
		char_hash[:start_year] = parse[3].to_i
		char_hash[:end_year] = parse[3].to_i
	end
	char_arr.push(char_hash)
end

plus_150 = []

char_arr.each do |char|
	if char[:episodes].to_i > 150
		plus_150.push(char)
	end
end

puts plus_150

less_10 = []

char_arr.each do |char|
	if char[:episodes].to_i < 10
		less_10.push(char)
	end
end

puts less_10.length

drs = []

char_arr.each do |char|
	if char[:character].include?("Dr.")
		drs.push(char)
	end
end

puts drs

# File.write("../../Homework/doctors.txt", drs.to_json) 

oh_seven = []

char_arr.each do |char|
	if char[:start_year] <= 2007 && char[:end_year] >= 2007
		oh_seven.push(char)
	end
end

puts oh_seven.length 