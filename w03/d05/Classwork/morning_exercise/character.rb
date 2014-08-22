require 'pry'

character_array = File.read("./greys.txt")

array = []
 character_array.split("\n").each do |x|
 	hash = {}
 	hash[:actor] = x.split(',')[0]
 	hash[:character] = x.split(',')[1]
 	hash[:episodes] = x.split(',')[2]
 	year = x.split(',')[3]
 	puts hash[:actor]
 	if year.length == 4
 		hash[:start_year] = year.to_i
 		hash[:end_year] = year.to_i
 	else
 		hash[:start_year] = year.split('-')[0].to_i
 		hash[:end_year] = year.split('-')[1].to_i
 	end
 	array << hash
 	
 end








binding.pry





