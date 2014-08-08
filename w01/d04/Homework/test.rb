class String
  def initial
    self[0,1]
  end
end

name_email = [ 
  ["Jeff Konowitch", "jeff.konowitch@generalassemb.ly"],
#   ["Neel Patel", "neel.patel@generalassemb.ly"],
#   ["Sean West", "sean.west@generalassemb.ly"],
#   ["Jake Schwartz", "j@generalassemb.ly"],
#   ["Brad Jacobs", "brad@google.com"],
#   ["Cynthia Silvers", "cynthia@google.com"],
#   ["Summer Sanders", "summer.sanders@nickelodeon.com"],
#   ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

a=0 
while a < name_email.length
	name_email[a][0].downcase!
 	a += 1
end 
 
# b=0
# while b < name_email.length 

name_email_array = name_email[0]

name_split = (name_email_array[0]).split(" ")

#print name_split

email_split_at = (name_email_array[1].split("@"))

print email_split_at

email_split_name = (email_split_at[0].split("."))

print email_split_name

initial_last = name_split[0].initial.to_s << name_split[1].to_s
	
	if name_split == email_split_name
		puts "This email address is following pattern a"
	elsif name_split[0] == email_split_at[0]
		puts "This email address is following pattern b"
	elsif name_email_array[0].delete(" ") == email_split_at[0]
		puts "This email address is following pattern c"
	elsif initial_last == email_split_at[0]
		puts "This email address is following pattern d"
	else
		puts "This email address doesn't follow a pattern"
	end

# 	b += 1
# end 

