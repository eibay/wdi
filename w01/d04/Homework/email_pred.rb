 
# change this and do this
#   name = name_email[x][0] 
#   email = name_email[x][1]
# emails_domain = email_split_at[1].to_sym 
# this is a common job interview project/test


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


counter = 0

until counter == name_email.count
  
  cur = name_email[counter]
  name = cur[0].split(" ")
  email = cur[1].split("@")

  if (name[0] + "." + name[1]).downcase == email[0].downcase
    puts "a"
  elsif name[0].downcase == email[0].downcase
    puts "b"
  elsif cur[0].delete(" ").downcase == email[0].downcase
    puts "c"
  elsif (cur[0][0].downcase) + (name[1].downcase) == email[0].downcase
    puts "d"
  else 
    puts "e"
    puts "does not match any patterns"
  end

  counter += 1
end

