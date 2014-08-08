	#require "pry"

	name_email = ["Sean West", "sean.west@generalassemb.ly"] #Scenario A
	name_split = name_email[0].split(" ") #Sean, West
	email_split = name_email[1].split(" ") #sean.west@generalassemb.ly
	first_name = name_split[0].downcase #Sean
	last_name = name_split[1].downcase # West
	domain = name_email[1].split("@")[1] #generalassemb.ly

#binding.pry
if first_name + "." + last_name == name_email #if sean.west
	puts "The name/email provided follows pattern a"

	elsif first_name == domain[0] #if sean
	puts "The name/email provided follows pattern b"

	elsif first_name + last_name == domain[0] #if sean and west altogether

	puts "The name/email provided follows pattern c"

	#elsif first_name.split(" ") + last_name == domain[0] #if sean split at whatever character you want + west
	puts "The name/email provided follows pattern d"

	else
	puts "Not able to recognize email format!"

	end
