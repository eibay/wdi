puts("Where do you want to go?")

locations= ["NEW YORK", "SAN FRANCISCO", "DALLAS", "ALBUQUERQUE" , "TORONTO"]
location= gets.chomp.upcase
if locations.include? location
	puts ("yes, we can go there")
else
	puts("invalid location")
end