#name_email = ["Brad Jacobs", "bradjacobs@google.com"]

 #name_email = ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"]
  name_email = ["Neel Patel", "neel.patel@generalassemb.ly"]
 # name_email = ["Sean West", "sean.west@generalassemb.ly"]
 # name_email = ["Jake Schwartz", "j@generalassemb.ly"]
 # name_email = ["Brad Jacobs", "brad@google.com"]
 # name_email = ["Cynthia Silvers", "cynthia@google.com"]
 # name_email = ["Summer Sanders", "summer.sanders@nickelodeon.com"]
 # name_email = ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]


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