file = File.read 'greys.txt'

ary_raw = file.split("\n")

ary_split_comma = []
ary_raw.each do |list|
	split = list.split(",")
	ary_split_comma << split
end

array_cast = []

ary_split_comma.each do |character|
	hash_character = {}
	hash_character[:actor] = character[0] unless character[0] == nil
	hash_character[:character] = character[1] unless character[1] == nil
	hash_character[:episodes] = character[2].split(" ")[0].to_i unless character[2] == nil
	hash_character[:start_year] = character[3].split("-")[0] unless character[3] == nil
	hash_character[:end_year] = character[3].split("-")[1] unless character[3] == nil
	hash_character[:end_year] = hash_character[:start_year] if hash_character[:end_year] == nil 
	
	array_cast << hash_character
end

puts array_cast




##################
##### STARS ######
##################

stars = []
array_cast.each do |character|
	unless character[:episodes] == nil #not sure if i need this, does it run despite error?
		stars << character[:actor] if character[:episodes] > 150
	end
end
puts stars

#######################
##### Minor Peeps #####
#######################

minor_peeps = []
array_cast.each do |character|
	unless character[:episodes] == nil
		minor_peeps << character[:actor] if character[:episodes] < 10
	end
end
puts minor_peeps.length

#######################
##### Dr. please! #####
#####################d##

doctors = []
array_cast.each do |character|
	unless character[:character] == nil
		doctors << character[:character] if character[:character].split(" ")[0] == "Dr."
	end
end
puts doctors

#######################
##### 2007 ############
#######################

twothousandandseven = []

array_cast.each do |character|
	unless character[:start_year].to_i > 2007 
		unless character[:end_year].to_i < 2007
			twothousandandseven << character[:character] 
		end
	end
end
puts twothousandandseven


