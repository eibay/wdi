# require 'sinatra'
require 'pry'

character_array =[]
character_array_1 = File.read("greys.txt")

character_array_1.split("\n").each do |x|
	hash_character = {}
	hash_character[:character] = x.split(",")[0]
	hash_character[:actor]= x.split(",")[1]
	hash_character[:episode]= x.split(",")[2].to_i

############################################################
#need to split start/end years#
# 	hash_character[:start_year]= x.split(",")[3].to_i
# 	hash_character[:end_year]= x.split("-")[4].to_i
# 	character_array<<hash_character
# 	end
############################################################
	year = x.split(",")[3]
	if year.length == 4
		hash_character[:start_year] = year.to_i
		hash_character[:end_year] = year.to_i
	else
		hash_character[:start_year] = x.split("-")[0].to_i
		hash_character[:end_year] = x.split("-")[1].to_i
	end
	character_array << hash_character
	end

############################################################
stars = []
character_array.each do |x|
	if x[:episode] > 150
		stars << x[:actor]
end
end
puts stars
############################################################
minor_peeps = []
character_array.each do |x|
	if x[:episode] < 10
		minor_peeps << x[:actor]
end
end
puts minor_peeps
############################################################
doctor = []
character_array.each do |x|
	if x[:actor].split(" ")[0] == "Dr."
		doctor << x[:actor]
end
end
puts doctor
############################################################
characters_2007 = []
character_array.each do |x|
	if x[:start_year].to_i <= 2007 && x[:end_year].to_i >= 2007
		characters_2007<< x[:actor]
end
end
puts characters_2007


binding.pry


