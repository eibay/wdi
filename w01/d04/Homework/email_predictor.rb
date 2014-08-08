require 'pry'

name_email = ["Sean West", "sean@generalassemb.ly"]

# Given an array of name/email combos, count up the total #number of times each pattern appears for a given domain #name.

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

patterns = {
	1: "generalassemb.ly" => [a: 0, b: 0, c: 0, d: 0, e: 0],
	2: "google.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
	3: "nickelodeon.com" => [a: 0, b: 0, c: 0, d: 0, e: 0]
}

split_name = name_email[0].split
split_email = name_email[1].split("@")

#DEBUG AREA
# print name_email
# puts
# puts "---------"
# print split_name
# ## USE SPLIT_NAME[0] TO COMPARE TO SPLIT_EMAIL[0]
# ## THIS WILL FIND OUT THE EMAIL PATTERN
# puts
# print split_email
# puts

if split_name[0].downcase == split_email[0]
	puts "Pattern B: first@domain"
elsif split_email[0].include?(".")
	puts "Pattern A: first.last@domin"
elsif name_email[0].split.join.downcase == split_email[0]
	puts "Pattern C: firstnamelastname@domin"
elsif split_name[0][0].downcase+split_name[1].downcase   == split_email[0]
	puts "Pattern D: firstinitiallastname@domain"
else 
	puts "Cannot determine pattern"
end
#binding.pry


