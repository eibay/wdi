require 'pry'
#Array style
name_email = ["Sean West", "sean.west@generalassemb.ly"]
# puts "The name/email provided follows pattern A" # Your code should detect that the above name/email combo follows pattern a.
first_email = ["Sean", "sean@generalassemb.ly"]
# # puts "The name/email provided follows pattern B"
first_last_email = ["Seanwest", "seanwest@generalassemb.ly"]
# # puts "The name/email provided follows pattern C"
first_initiallast_email = ["Swest", "swest@generalassemb.ly"]
# puts "The name/email provided follows pattern D"

name_email = [
	["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
	["Neel Patel", "neel.patel@generalassemb.ly"],
	["Sean West", "sean.west@generalassemb.ly"],
	["Jake Schwartz", "j@generalassemb.ly"],
	["Brad Jacobs", "brad@google.com"],
	["Cynthia Silvers", "cynthia@google.com"],
	["Summer Sanders", "summer.sanders@nickelodeon.com"],
	["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]


#after using binding.pry i get this error NoMethodError: undefined method `split' for ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"]:Array 
#which is happing on line 26
name_split = name_email[0].split(" ") #Sean, West
email_split = name_email[1].split(" ") #sean.west@generalassemb.ly
first_name = name_split[0].downcase #Sean
last_name = name_split[1].downcase #West
domain = name_email[1].split("@")[1] #generalassemb.ly

if first_name + "." + last_name = name_email #sean.west
	puts "The name/email provided follows pattern a"

elsif first_name = first_email #sean
	puts "The name/email provided follows pattern b"

elsif 
	first_name + last_name = first_last_email #seanwest
	puts "The name/email provided follows pattern c"

elsif 
	first_name.split(" ") + last_name = first_initiallast_email #swest
	puts "The name/email provided follows pattern d"

else
	put "The name/email provided does not follow any patterns!"
end
 	 

	




