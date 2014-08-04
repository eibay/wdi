puts("Where would you like to go?")
location=gets.chomp.downcase

if location=="new york"
	puts("Lets GO to NEW YORK")
elsif location=="san francisco"
	puts("Lets GO to SAN FRANCISCO")
elsif location=="dallas"
	puts("Lets GO to DALLAS")
elsif location=="alberquerque"
	puts("Lets GO to ALBERQUERQUE")
elsif location=="toronto" 
	puts("Lets GO to TORONTO")
else puts("Sorry, we don't go there")
end

=begin
	
  if location=="new york" || location=="san francisco" || location=="dallas" || location=="alberquerque"||locatuon="toronto"
 	puts("Lets DO")
 	else puts("Try again")
	
=end