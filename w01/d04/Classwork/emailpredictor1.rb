## HOMEWORK SOLUTION PART 1, Tess' code

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
while y < name_email.length # takes the entire length of the array, loop will stop if y is less than the length of the name
  name_email[y][0].downcase! # [0] starts it from the first part in the array and sets it to lowercase
  y += 1 # incrementing Y
end # loop is done

x=0
a=0
b=0
c=0
d=0
e=0 

emails = {

}

x=0
while x < name_email.length # x is while loop incrementor 
  name = name_email[x][0] # grabbing "Jeff Konowitch" 
  email = name_email[x][1] # grabbing "jeffkonowitch@generalassemb.ly"

  name_split = name.split(" ") # splitting "Jeff Konowitch" into Jeff, Konowitch
  email_split_at = (email.split("@")) # splits into "jeffkonowitch, generalassemb.ly"

  email_split_at_dot = email_split_at[0].split(".") #splits the first name, whole name, or initial of the email
  
  # initial_last = name_split[0].initial.to_s + name_split.to_s  IGNORE, WON'T WORK
  

  emails_domain = email_split_at[1].to_sym # domain name 

# first = name_split[0]
# last = name_split[1] 
# could have used that and subtituted name_split[0] as first

  if name_split == email_split_at_dot 
    puts "This email address is following pattern a"
    puts emails[emails_domain]= [a+=1, b+=0, c+=0, d+=0, e+=0]
   elsif name_split[0] == email_split_at[0]
    puts "This email address is following pattern b"
    puts emails[emails_domain]= [a+=0, b+=1, c+=0, d+=0, e+=0]
  
   elsif email_split_at[0] == name.delete(" ") # example: Sean West => SeanWest
    puts  "This email address is following pattern c"
    puts emails[emails_domain]= [a+=0, b+=0, c+=1, d+=0, e+=0]
  
   # elsif initial_last == email_split_at[0]
   #  puts "This email address is following pattern d"
   #  puts emails[emails_domain]= [a+=0, b+=0, c+=0, d+=1, e+=0] IGNORE, WON'T WORK
    
  else
    puts "This email address doesn't follow a pattern"
    puts emails[emails_domain]= [a+=0, b+=0, c+=0, d+=0, e+=1]
  end

x += 1
end 
print emails


 #can't figure out how to restart the pattern counter when a new domain name is added
  


