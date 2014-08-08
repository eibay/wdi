
require'pry'


name_email = ["Sean West", "sean.west@generalassemb.ly"]

# given the FIRST NAME, LAST NAME, and EMAIL; we want to predict what pattern the email belongs to

#These are the patterns:
# a. first.last (ie, jeffrey.konowitch)
# b. first (ie, jeffrey)
# c. firstlast (ie, jeffreykonowitch)
# d. first_initiallast (ie, jkonowitch)
# e. doesn't match any patterns

firstpart = (name_email[1].split("@"))[0]
firstlower = name_email[0].downcase

if firstpart.include?(".")
	puts("Follows pattern a. first.last (ie, jeffrey.konowitch)")

elsif firstpart == firstlower.split[0]
	puts("Follows pattern b. first (ie, jeffrey)")

elsif firstlower.split.join == firstpart
	puts("Follows pattern c. firstlast (ie, jeffreykonowitch)")

elsif firstlower.split.join[0]+firstlower.split[1] == firstpart
	puts("Follows pattern d. first_initiallast (ie, jkonowitch)")

else
	puts("doesn't match any patterns!")

end


# Given: an array of email combos
# must code a way such that it counts the total number of times each pattern appaears for a given domain

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

firstpart1 = (names_emails[1].split("@"))[0]
"generalassemb.ly" = []

{
  "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
  "google.com" => [a: 0, b: 2, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 2, b: 0, c: 0, d: 0, e: 0],
}



