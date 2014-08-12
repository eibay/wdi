# a. first.last (ie, jeffrey.konowitch)
# b. first (ie, jeffrey)
# c. firstlast (ie, jeffreykonowitch)
# d. first_initiallast (ie, jkonowitch)
# e. doesn't match any patterns

## HOMEWORK incomplete! code still in beta! line 65 interrupt error.##

#PART 1

name_email = ["Sean West", "sean.west@generalassemb.ly"]
name_split = name_email[0].split(" ") #Sean, West
email_split = name_email[1].split(" ") #sean.west@generalassemb.ly
first_name = name_split[0].downcase #Sean
last_name = name_split[1].downcase # West
domain = name_email[1].split("@")[1] #general.assemb.ly

if "#{first_name}.#{last_name}"==domain[0]
  pattern="a" 
  puts "The name/email provided follows pattern a"

elsif "#{first_name}"==domain[0]
  pattern="b"
  puts "The name/email provided follows pattern b"

elsif "#{first_name}#{last_name}"==domain[0]
  puts "The name/email provided follows pattern c"

elsif "#{first_name[0]}#{last_name}"==domain[0]
  puts "The name/email provided follows pattern d"
else
  "Not able to recognize email format!"
end

####################################################################

#PART 2

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
index = 0

email_domains= {
  "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
  "google.com" =>       [a: 0, b: 2, c: 0, d: 0, e: 0],
  "nickelodeon.com" =>  [a: 2, b: 0, c: 0, d: 0, e: 0],
}

while index< names_emails.count
  name_split = name_email[0].split(" ") 
  email_split = name_email[1].split(" ") 
  first_name = name_split[0].downcase 
  last_name = name_split[1].downcase 
  domain = name_email[1].split("@")[1] 

  email_second = name_email[1].split("@")[1] 

email_domains =+1

if email_second=="generalassemb.ly"

  if "#{first_name}.#{last_name}" == domain[0]
  email_domains["generalassemb.ly"][0][:a]+=1

  elsif"#{first_name}" == domain[0]
  email_domains["generalassemb.ly"][0][:b]+=1 

  elsif"#{first_name}#{last_name}"==domain[0]
  email_domains["generalassemb.ly"][0][:c]+=1 

  elsif"#{first_name[0]}#{last_name}"==domain[0]
  email_domains["generalassemb.ly"][0][:d]+=1

  else email_domains["generalassemb.ly"][0][:e]+=1
  end

elsif email_second=="google.com"

  if "#{first_name}.#{last_name}" == domain[0]
  email_domains["google.com"][0][:a]+=1

  elsif"#{first_name}" == domain[0]
  email_domains["google.com"][0][:b]+=1 

  elsif"#{first_name}#{last_name}"==domain[0]
  email_domains["google.com"][0][:c]+=1 

  elsif"#{first_name[0]}#{last_name}"==domain[0]
  email_domains["google.com"][0][:d]+=1

  else email_domains["google.com"][0][:e]+=1
  end

elsif email_second=="nickelodeon.com"

   if "#{first_name}.#{last_name}" == domain[0]
  email_domains["nickelodeon.com"][0][:a]+=1

  elsif"#{first_name}#" == domain[0]
  email_domains["nickelodeon.com"][0][:b]+=1 

  elsif"#{first_name}#{last_name}"==domain[0]
  email_domains["nickelodeon.com"][0][:c]+=1 

  elsif"#{first_name}[0]#{last_name}"==domain[0]
  email_domains["nickelodeon.com"][0][:d]+=1

  else email_domains["nickelodeon.com"][0][:e]+=1
  end
end
end

puts email_domains.count


