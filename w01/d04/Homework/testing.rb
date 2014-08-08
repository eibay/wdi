#  * a. first.last (ie, jeffrey.konowitch)
#   * b. first (ie, jeffrey)
#   * c. firstlast (ie, jeffreykonowitch)
#   * d. first_initiallast (ie, jkonowitch)
#   * e. doesn't match any patterns

# ```ruby
# name_email = ["Sean West", "sean.west@generalassemb.ly"]

# # Your code should detect that the above name/email combo follows pattern a.
# puts "The name/email provided follows pattern a"
# ```

# *You may want to test several name/email pairs to make sure your code works.*

# 2) Given an array of name/email combos, count up the total number of times each pattern appears for a given domain name.

# Given an array of inputs:
# ```ruby
# names_emails = [ 
#   ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
#   ["Neel Patel", "neel.patel@generalassemb.ly"],
#   ["Sean West", "sean.west@generalassemb.ly"],
#   ["Jake Schwartz", "j@generalassemb.ly"],
#   ["Brad Jacobs", "brad@google.com"],
#   ["Cynthia Silvers", "cynthia@google.com"],
#   ["Summer Sanders", "summer.sanders@nickelodeon.com"],
#   ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
# ]



# a = "jeff.konowitch@generalassemb.ly"
# a.split(".")

# b = "Jeffrey Konowitch"
# b.split(" ")

# c = "Jeffrey Konowitch"
# c.split("f")

# a = ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"]
# a[1].split("@")

# b = ["Jeffrey Konowitch", "jeff@generalassemb.ly"]
# b[1].split("@")



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




# patterns = {
#   a: first.last (ie, jeffrey.konowitch),
#   b: first (ie, jeffrey),
#   c: firstlast (ie, jeffreykonowitch),
#   d: first_initiallast (ie, jkonowitch),
#   e: doesn't match any patterns
# }





