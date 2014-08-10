

location= "boston"

=begin
or could have done new_york="New York" etc and use the strings	
it is not necessarycan put variables into arrays
=end

valid_locations = ["new york", "san francisco", "dallas"]


index = 0
found = false

while (index < 3 && valid_locations != location)
	if location==valid_locations[index]
	found = true
end
index += 1
end

if found 
	puts("lets go")
	

else

 puts("NO")
end



# puts("Where would you like to go?")
# location=gets.chomp.downcase

# if location=="new york"
# 	puts("Lets GO to NEW YORK")
# elsif location=="san francisco"
# 	puts("Lets GO to SAN FRANCISCO")
# elsif location=="dallas"
# 	puts("Lets GO to DALLAS")
# elsif location=="alberquerque"
# 	puts("Lets GO to ALBERQUERQUE")
# elsif location=="toronto" 
# 	puts("Lets GO to TORONTO")
# else puts("Sorry, we don't go there")
# end



=begin
	
  if location=="new york" || location=="san francisco" || location=="dallas" || location=="alberquerque"||locatuon="toronto"
 	puts("Lets DO")
 	else puts("Try again")
	
=end

=begin
the gets chomp and downcase

case location
	when "New York"
		puts("Lets go")
	when "San Francisco"
		puts("Lets go")
	when "Dallas"
		puts("Lets go")
	else puts("Try again")
end
	
=end