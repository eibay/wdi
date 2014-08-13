class String
  def initial
    self[0,1]
  end
end

name_email = [ 
  ["Jeff Konowitch", "jeffkonowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]


y=0 
while y < name_email.length
	name_email[y][0].downcase!
 	y += 1
end 

x=0
a=0
b=0
c=0
d=0
e=0
emails = {

}

while x < name_email.length 
	name = name_email[x][0] 
	email = name_email[x][1] 

	name_split = name.split(" ") 

	email_split_at = (email.split("@")) 

	email_split_at_dot = email_split_at[0].split(".") 
	initial_last = name_split[0].initial.to_s << name_split.to_s
	emails_domain = email_split_at[1].to_sym 



	if name_split == email_split_at_dot
		puts "This email address is following pattern a"
		puts emails[emails_domain]= [a+=1, b+=0, c+=0, d+=0, e+=0]
	 elsif name_split[0] == email_split_at[0]
	 	puts "This email address is following pattern b"
	 	puts emails[emails_domain]= [a+=0, b+=1, c+=0, d+=0, e+=0]
	
	 elsif email_split_at[0] == name.delete(" ")
		puts 	"This email address is following pattern c"
		puts emails[emails_domain]= [a+=0, b+=0, c+=1, d+=0, e+=0]
	
	 elsif initial_last == email_split_at[0]
		puts "This email address is following pattern d"
		puts emails[emails_domain]= [a+=0, b+=0, c+=0, d+=1, e+=0]
		
	else
		puts "This email address doesn't follow a pattern"
		puts emails[emaxils_domain]= [a+=0, b+=0, c+=0, d+=0, e+=1]
	end

x += 1
end	
print emails




# #Array style
# name_email = ["Sean West", "sean.west@generalassemb.ly"]
# # puts "The name/email provided follows pattern A" # Your code should detect that the above name/email combo follows pattern a.
# first_email = ["Sean", "sean@generalassemb.ly"]
# # # puts "The name/email provided follows pattern B"
# first_last_email = ["Seanwest", "seanwest@generalassemb.ly"]
# # # puts "The name/email provided follows pattern C"
# first_initiallast_email = ["Swest", "swest@generalassemb.ly"]
# # puts "The name/email provided follows pattern D"

# name_email = [
# 	["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
# 	["Neel Patel", "neel.patel@generalassemb.ly"],
# 	["Sean West", "sean.west@generalassemb.ly"],
# 	["Jake Schwartz", "j@generalassemb.ly"],
# 	["Brad Jacobs", "brad@google.com"],
# 	["Cynthia Silvers", "cynthia@google.com"],
# 	["Summer Sanders", "summer.sanders@nickelodeon.com"],
# 	["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
# ]

# index_1=0
# index_2=0

# while 

# 	name_email[index_1][index_2] == 0
	
# 	name_split = name_email[0][0].split(" ") #Sean, West
# 	email_split = name_email[1].split(" ") #sean.west@generalassemb.ly
# 	first_name = name_split[0].downcase #Sean
# 	last_name = name_split[1].downcase #West
# 	domain = name_email[1].split("@")[1] #generalassemb.ly

# 	if first_name + "." + last_name = name_email #sean.west
# 		puts "The name/email provided follows pattern a"

# 	elsif first_name = first_email #sean
# 		puts "The name/email provided follows pattern b"

# 	elsif 
# 		first_name + last_name = first_last_email #seanwest
# 		puts "The name/email provided follows pattern c"

# 	elsif 
# 		first_name.split(" ") + last_name = first_initiallast_email #swest
# 		puts "The name/email provided follows pattern d"

# 	else
# 		put "The name/email provided does not follow any patterns!"
# 	end

# 	name_email[index_1][index_2] += 1
# end	 

	




