name_email = ["Brad Jacobs", "bradjacobs@google.com"]

name = name_email[0]
email = name_email[1]
first_name = name.split(" ")[0].downcase
last_name = name.split(" ")[1].downcase
prefix = email.split("@")[0]


if
	prefix == "#{first_name}.#{last_name}" #compare prefix == expected pattern
	puts "The name/email provided follows pattern a"
	elsif
	prefix == "#{first_name}"
	puts "The name/email provided follows pattern b"
	elsif
	prefix == "#{first_name}#{last_name}"
	puts "The name/email provided follows pattern c"
	else
	puts "Doesn't match any pattern"
end
