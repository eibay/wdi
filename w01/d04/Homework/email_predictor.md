<!-- # Email Predictor

Remember the email predictor algorithm we came up with in class? Your task is to implement this.

**Don't forget to write, think, or talk out the flow of your program without code first!!**

### Algorithm

#### Part 1 - Classification

1) Given a first/last and an email, be able to detect if it follows one of the following patterns and write the pattern letter to the terminal:
  * a. first.last (ie, jeffrey.konowitch)
  * b. first (ie, jeffrey)
  * c. firstlast (ie, jeffreykonowitch)
  * d. first_initiallast (ie, jkonowitch)
  * e. doesn't match any patterns

```ruby
name_email = ["Sean West", "sean.west@generalassemb.ly"]

# Your code should detect that the above name/email combo follows pattern a.
puts "The name/email provided follows pattern a"
```

*You may want to test several name/email pairs to make sure your code works.* -->

<!-- 
######
GOAL = 
get their info: first, last, email

check to see if their "email_full_name" matches their input full name(first+last)

      break down their email into name and domain
      combine their first and last input name to full name in email

compare the structure of their email address to pattern email addresses

if their email "full name" is ONLY first name, then matches pattern_b
###### -->


puts "What is your first name?"
first = gets.chomp

puts "What is your last name?"
last = gets.chomp

puts "What is your email address?"
user_email = gets.chomp

email_addy_array = user_email.split(@) 
<!-- #this gives us an array with totalname and domain
 -->
email_full_name = email_addy_array[0]
<!--     #this gives us values to compare to user first and last
 -->
email_domain = email_addy_array[1]
<!--     #this gives us domain piece to compare to pattern structure
 -->

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
















<!-- 2) Given an array of name/email combos, count up the total number of times each pattern appears for a given domain name.

Given an array of inputs:
```ruby
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
```

Your code should generate the following hash: 

```ruby

{
  "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
  "google.com" => [a: 0, b: 2, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 2, b: 0, c: 0, d: 0, e: 0],
}

```

#### Part 2 - Prediction

1) Given a name/domain name pair predict what their email address is based on the pattern that was found the most.
  * If the most found pattern was `e` then ouput "Cannot predict."

```ruby
["PJ Hughes", "generalassemb.ly"]

# Your code should output:

puts ["pj.hughes@generalassembl.ly"]
```

2) Predict a batch of email addresses at once:

```ruby
[
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

# Your code should output:
puts [
  "pj.hughes@generalassemb.ly",
  "eric@google.com",
  "kel.mitchell@nickelodeon.com",
]
```
 -->