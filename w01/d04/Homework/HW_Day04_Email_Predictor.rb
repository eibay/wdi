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


######

# GOAL = 
# get their info: first, last, email

# check to see if their "email_full_name" matches their input full name(first+last)

#       break down their email into name and domain
#       combine their first and last input name to full name in email

# compare the structure of their email address to pattern email addresses


puts "What is your first name?"
first = gets.chomp.downcase

puts "What is your last name?"
last = gets.chomp.downcase

puts "What is your email address?"
user_email = gets.chomp.downcase

email_addy_array = user_email.split('@') 
        #this gives us an array with totalname and domain
email_full_name = email_addy_array[0]
        #this gives us values to compare to user first and last
        ##ended up not using because we can compare first and last right
        ##in our patterns (a-e)
email_domain = email_addy_array[1]
        #this gives us domain piece to compare to pattern structure
first_array = first.split(//)
first_initial = first_array[0]

pattern_a = first+"."+last+'@'+email_domain
pattern_b = first+'@'+email_domain
		#pattern_b = "first@domain" #this doesnt work because it's just a string. 
		#it won't reference those variables in the string.
pattern_c = first+last+'@'+email_domain
pattern_d = first_initial+last+'@'+email_domain


if user_email == pattern_a
puts "The name/email combo provided follows pattern a: first.last@domain"

elsif user_email == pattern_b
puts "The name/email combo provided follows pattern b: first@domain"

elsif user_email == pattern_c
puts "The name/email combo provided follows pattern c: firstlast@domain"

elsif user_email == pattern_d
puts "The name/email combo provided follows pattern d: first_initial@lastdomain"

else puts "The name/email combo provided follows pattern e, meaning it does not follow any pattern."

end

#another way to do the 'if' statements without using pattern_a, etc variables
#if email_full_name == first+last #(pattern a)




2) Given an array of name/email combos, count up the total number of 
times each pattern appears for a given domain name.

Given an array of inputs:

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

Your code should generate the following hash:

{
  "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
  "google.com" => [a: 0, b: 2, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 2, b: 0, c: 0, d: 0, e: 0],
}

Steps

1. "Read" the inputs. 
2. Pull name from [0] and email from [1] 
of the index names_emails using comma as a delimiter


individual = names_emails.split(',') #new array with individual email addy's
#i'm getting an error here, for undefined method. not sure why....




3. Pull name out of names_emails[0] email array (we have a version of this)



4. Pull email domain out of email address
5. See what pattern the email address falls into (pop in previous code for this)
6. Count how many times each pattern appears


1. "Read" the inputs. 
2. Pull name from [0] and email from [1] 
of the index names_emails using comma as a delimiter
3. Pull first and last name out of names_emails[0] email array (we have a version of this)
4. Pull email domain out of email address
5. See what pattern the email address falls into (pop in previous code for this)
6. Count how many times each pattern appears

email_addy_array = user_email.split('@') 
        #this gives us an array with totalname and domain
email_full_name = email_addy_array[0]
        #this gives us values to compare to user first and last
        ##ended up not using because we can compare first and last right
        ##in our patterns (a-e)
email_domain = email_addy_array[1]
        #this gives us domain piece to compare to pattern structure
first_array = first.split(//)
first_initial = first_array[0]

pattern_a = first+"."+last+'@'+email_domain
pattern_b = first+'@'+email_domain
		#pattern_b = "first@domain" #this doesnt work because it's just a string. 
		#it won't reference those variables in the string.
pattern_c = first+last+'@'+email_domain
pattern_d = first_initial+last+'@'+email_domain



























