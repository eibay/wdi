require 'pry'

name_email = ["Jake Schwartz", "j@generalassemb.ly"]

# binding.pry

split_name = name_email[0].split (" ") #Creates array ["firstname" "lastname"]
split_email = name_email.last.split ("@") #Creates array [ "emailname" "@domain.com"]
firstname = split_name[0].downcase #Extracts [firstname]
lastname = split_name[1].downcase #Extracts [lastname]
emailname = split_email[0] #Extracts [emailname]
domain = split_email[1] #Extracts [domain.com]

pattern_a = firstname + "." + lastname
pattern_b = firstname
pattern_c = firstname + lastname
pattern_d = firstname[0] + lastname
pattern_e = "None of the above."



if emailname == pattern_a
	puts "The name/email provided follows pattern A."
 
 	elsif emailname == pattern_b
	puts "The name/email provided follows pattern B."

	elsif emailname == pattern_c
	puts "The name/email provided follows pattern C."

	elsif emailname == pattern_d
	puts "The name/email provided follows pattern D."

	else
	puts "The name/email does not follow a pattern."
end

n = 0
while condition
	
end