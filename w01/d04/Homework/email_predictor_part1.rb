name_email = ["Sean West", "sean.west@generalassmb.ly"]

name = name_email[0].split(" ")

f_name = name[0].downcase 
l_name = name[1].downcase 

email = name_email[1].split("@")

screen_name = email[0]
domain_name = email[1]


a = f_name + "." + l_name
b = f_name
c = f_name + l_name
d = f_name[0] + l_name
e = "nothing"



if screen_name == a 
	puts "a"
elsif screen_name == b
	puts "b"
elsif screen_name == c
	puts "c"
elsif screen_name == d
	puts "d"
else
end





