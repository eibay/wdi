require 'pry'

character_str = File.read("./greys.txt")

array = []
 character_str.split("\n").each do |x|
 	hash = {}
 	hash[:actor] = x.split(',')[0]
 	hash[:character] = x.split(',')[1]
 	hash[:episodes] = x.split(',')[2].split(' ')[0].to_i

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

# Stars
# 
onefifty_array = []
array.each do |y|
	if y[:episodes] > 150
		onefifty_array << y
	end
end

# Minor peeps
# 
peeps_array = []
array.each do |z|
	if z[:episodes] < 10
		peeps_array << z
	end
end
less_than_10 = peeps_array.length

# Dr. Please!
# 
dr_array = []
array.each do |hodor|
	if hodor[:character].split(" ")[0] == "Dr."
		dr_array << hodor
	end
end

# 2007
# 
oseven_array = []
oseven_characters = []

array.each do |a|
	if a[:start_year] <= 2007 && a[:end_year] >= 2007
		oseven_array << a	
	end
end

oseven_array.each do |b|
		oseven_characters << b[:character]
end



binding.pry





