name_email = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

name = name_email[0].split(" ")
email = name_email[1].split("@")
counter = 0

until counter > name_email.count


if (name[0] + "." + name[1]).downcase == email[0].downcase
  puts "a"

elsif name[0].downcase == email[0].downcase
  puts "b"

elsif name_email[0].delete(" ").downcase == email[0].downcase
  puts "c"

elsif (name_email[0][0].downcase) + (name[1].downcase) == email[0].downcase
  puts "d"

else 
  puts "e"
  puts "does not match any patterns"
end

end

