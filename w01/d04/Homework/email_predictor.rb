#Array style

 # puts "The name/email provided follows pattern A" # Your code should detect that the above name/email combo follows pattern a.



# # puts "The name/email provided follows pattern B"



# # puts "The name/email provided follows pattern C"



# puts "The name/email provided follows pattern D"

#e_mail_styles = [[name_dot_email = ["Sean West", "sean.west@generalassemb.ly"],[first_email = ["Sean", "sean@generalassemb.ly"],[first_last_email = ["Seanwest", "seanwest@generalassemb.ly"],[first_initiallast_email = ["Swest", "swest@generalassemb.ly"]]]


	name_email = ["Sean West", "sean.west@generalassemb.ly"] #Scenario A
	name_split = name_email[0].split(" ") #Sean, West
	email_split = name_email[1].split(" ") #sean.west@generalassemb.ly
	first_name = name_split[0].downcase #Sean
	last_name = name_split[1].downcase # West
	domain = name_email[1].split("@")[1] #generalassemb.ly


	first_email = ["Sean", "sean@generalassemb.ly"] #Scenario B
	first_last_email = ["Seanwest", "seanwest@generalassemb.ly"] #Scenario C
	first_initiallast_email = ["Swest", "swest@generalassemb.ly"] #Scenario D

	if first_name + "." + last_name == name_email #if sean.west
	puts "The name/email provided follows pattern a"

	elsif first_name == first_email #if sean
	puts "The name/email provided follows pattern b"

	elsif first_name + last_name == first_last_email #if sean and west altogether
	puts "The name/email provided follows pattern c"

	elsif first_name.split(" ") + last_name == first_initiallast_email #if sean split at whatever character you want + west
	puts "The name/email provided follows pattern d"

	else
	puts "Not able to recognize email format!"

	end
