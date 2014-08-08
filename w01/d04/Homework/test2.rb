class String
  def initial
    self[0,1]
  end
end
#string.split("") will make each characters in a string a seperate list item. can then call array[0] to find first initial

name_email = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  # ["Neel Patel", "neel.patel@generalassemb.ly"],
  # ["Sean West", "sean.west@generalassemb.ly"],
  # ["Jake Schwartz", "j@generalassemb.ly"],
  # ["Brad Jacobs", "brad@google.com"],
  # ["Cynthia Silvers", "cynthia@google.com"],
  # ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  # ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

y=0 
while y < name_email.length
	name_email[a][0].downcase!
 	y += 1
end 


name_split = (name_email[0]).split(" ")

#print name_split

email_split_at = (name_email[1].split("@"))

#print email_split_at

email_split_name = (email_split_at[0].split("."))

#print email_split_name

initial_last = name_split[0].initial << name_split[1]


# x=0
# email_split_at_dot=[]

# while x < email_split_at.length
# 	email_split_at_dot.push(email_split_at[x].split("."))
# 	x += 1
# end 
# print email_split_at_dot.flatten 


if name_split == email_split_name
	puts "This email address is following pattern a"
elsif name_split[0] == email_split_at[0]
	puts "This email address is following pattern b"
elsif name_email[0].delete(" ") == email_split_at[0]
	puts "This email address is following pattern c"
elsif initial_last == email_split_at[0]
	puts "This email address is following pattern d"
else
	puts "This email address doesn't follow a pattern"
end


emails{

}
# "generalassemb.ly" => []
# "google.com" => []
# "nickelodeon.com" => []
# }

# vladimir_putins_brain[:number_of_wishes]="three"  



#print email_split_at_dot.flatten
# print email_split_at

 

