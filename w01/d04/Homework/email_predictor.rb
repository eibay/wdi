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
first = gets.chomp

puts "What is your last name?"
last = gets.chomp

puts "What is your email address?"
user_email = gets.chomp

email_addy_array = user_email.split('@') 
        #this gives us an array with totalname and domain
email_full_name = email_addy_array[0]
        #this gives us values to compare to user first and last
email_domain = email_addy_array[1]
        #this gives us domain piece to compare to pattern structure

pattern_a = "first.last@domain"
pattern_b = "first@domain"
pattern_c = "firstlast@domain"
pattern_d = "first_initial@lastdomain"


if user_email == pattern_a
puts "The name/email combo provided follows pattern a: first.last@domain"

elseif user_email == pattern_b
puts "The name/email combo provided follows pattern b: first@domain"

elseif user_email == pattern_c
puts "The name/email combo provided follows pattern c: firstlast@domain"

elseif user_email == pattern_d
puts "The name/email combo provided follows pattern d: first_initial@lastdomain"

else puts "The name/email combo provided follows pattern e, meaning it does not follow any pattern.
