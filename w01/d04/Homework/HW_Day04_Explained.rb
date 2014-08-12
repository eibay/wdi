# Email Predictor

# Remember the email predictor algorithm we came up with in class? Your task is to implement this.

# **Don't forget to write, think, or talk out the flow of your program without code first!!**

# ### Algorithm

# #### Part 1 - Classification

# 1) Given a first/last and an email, be able to detect if it follows one of the following patterns and write the pattern letter to the terminal:
#   * a. first.last (ie, jeffrey.konowitch)
#   * b. first (ie, jeffrey)
#   * c. firstlast (ie, jeffreykonowitch)
#   * d. first_initiallast (ie, jkonowitch)
#   * e. doesn't match any patterns

# ```ruby
# name_email = ["Sean West", "sean.west@generalassemb.ly"]

# # Your code should detect that the above name/email combo follows pattern a.
# puts "The name/email provided follows pattern a"
# ```

# *You may want to test several name/email pairs to make sure your code works.* -->

# 2) Given an array of name/email combos, count up the total number of times each pattern appears for a given domain name.

# Given an array of inputs:

# names_emails = [ 
#   ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
#   ["Neel Patel", "neel.patel@generalassemb.ly"],
#   ["Sean West", "sean.west@generalassemb.ly"],
#   ["Jake Schwartz", "j@generalassemb.ly"],
#   ["Brad Jacobs", "brad@google.com"],
#   ["Cynthia Silvers", "cynthia@google.com"],
#   ["Summer Sanders", "summer.sanders@nickelodeon.com"],
#   ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
# ]

# Your code should generate the following hash:

# {
#   "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
#   "google.com" => [a: 0, b: 2, c: 0, d: 0, e: 0],
#   "nickelodeon.com" => [a: 2, b: 0, c: 0, d: 0, e: 0],
# }


names_emails = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

names_emails[0]
#gives us => ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"]

names_emails[0][0]
#gives us => Jeffrey Konowitch
#this is more efficient than what I was doing, which was trying to split again 
#after splitting out the first array

#but you have to assign it to something if you want to be able to recall it
#and use it later

counter = 0
while y < names_emails.length
#this helps us iterate thru each name/email array in the larger array
	names_emails[y][0] #the [0] gives you the first part of the first array 
						#which is the first name


#this is just a small step to prep the name to make it lowercase b4 using it
 y=0 
 while y < name_email.length
 	name_email[y][0].downcase! #makes the name (first and last) lowercase
  	y += 1
 end 



this is for part 2 of the assignment
# a=0
# b=0
# c=0
# d=0
# e=0
emails = {

}

x=0 #we could have used the [y] counter above but 
	#should always use different counters to perform different functions


#separating elements out like we do below is called 'parsing'

while x < name_email.length 
	name = name_email[x][0] #dealing with the first part of the first array: name
	email = name_email[x][1] #dealing with the second part of the first array: email

	name_split = name.split(" ") #this gives us the first name and second name	
	#this below would have given same output
	#name_split = name_email[x][0].split

	email_split_at = (email.split("@")) #this gives us name and domain part of emails

	email_split_at_dot = email_split_at[0].split(".") 
	#she chose to split out the last part: #.com or .ly, or .edu

	initial_last = name_split[0].initial.to_s << name_split.to_s
	#she chose this way to get the first initial (method '.initial')
	#then she made it an array

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
		puts emails[emails_domain]= [a+=0, b+=0, c+=0, d+=0, e+=1]
	end

x += 1
end	
print emails


 #can't figure out how to restart the pattern counter when a new domain name is added








