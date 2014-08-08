require 'pry'
#Email Predictor Part 1 - 1
# name_email = ["Sean West", "seanwest@generalassemb.ly"]
# name_split = name_email[0].split(" ")
# first_name = name_split[0].downcase
# last_name = name_split[1].downcase
# email_split = name_email[1].split("@")
# email_head = email_split[0]
# domain = email_split[1]

# puts first_name + "." + last_name

# if email_head == first_name + "." + last_name
# 	pattern = "a"
# elsif email_head == first_name
# 	pattern = "b"
# elsif email_head == first_name + last_name
# 	pattern = "c"
# elsif email_head == first_name[0] + last_name
# 	pattern = "d"
# else
# 	pattern = "e"
# end

# puts "The name/email provided follows pattern #{pattern}"

#-----

# Part 1 - 2
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

domain_pattern = {
  "generalassemb.ly" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "google.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 0, b: 0, c: 0, d: 0, e: 0]
}

count = 0

while count < names_emails.length
	names_emails.each do |x|
		name_split = x[0].split(" ")
		first_name = name_split[0].downcase
		last_name = name_split[1].downcase
		email_split = x[1].split("@")
		email_head = email_split[0]
		domain = email_split[1]
		if email_head == first_name + "." + last_name
			pattern = :a
		elsif email_head == first_name
			pattern = :b
		elsif email_head == first_name + last_name
			pattern = :c
		elsif email_head == first_name[0] + last_name
			pattern = :d
		else
			pattern = :e
		end
		if domain == "generalassemb.ly"
			domain_pattern["generalassemb.ly"][0][pattern] += 1
		elsif domain == "google.com"
			domain_pattern["google.com"][0][pattern] += 1
		elsif domain == "nickelodeon.com"
			domain_pattern["nickelodeon.com"][0][pattern] += 1
		end
		count += 1
	end
end

# puts domain_pattern

#-----

# Part 2

# ["PJ Hughes", "generalassemb.ly"]

# # Your code should output:

# puts ["pj.hughes@generalassembl.ly"]
# ```
# name_email = ["PJ Hughes", "generalassemb.ly"]
# full_name = name_email[0].split(" ")
# first_name = full_name[0].downcase
# last_name = full_name[1].downcase
# domain = name_email[1]

# if domain == "generalassemb.ly"
# 	max_pattern = domain_pattern["generalassemb.ly"][0].max_by{|k, v| v}[0]
# elsif domain == "google.com"
# 	max_pattern = domain_pattern["google.com"][0].max_by{|k, v| v}[0]
# elsif domain == "nickelodeon.com"
# 	max_pattern = domain_pattern["nickelodeon.com"][0].max_by{|k, v| v}[0]
# end

# if max_pattern == :a
# 	prediction = ["#{first_name}.#{last_name}@#{domain}"]
# elsif max_pattern == :b
# 	prediction = ["#{first_name}@#{domain}"]
# elsif max_pattern == :c
# 	prediction = ["#{first_name}#{last_name}@#{domain}"]
# elsif max_pattern == :d
# 	prediction = ["#{first_name[0]}#{last_name}@#{domain}"]
# elsif max_pattern == :e
# 	prediction = ["No predictable pattern"]
# end

# puts prediction

#-----
# Part 2 - 2
# 2) Predict a batch of email addresses at once:

# ```ruby
# [
#   ["PJ Hughes", "generalassemb.ly"],
#   ["Eric Schmidt", "google.com"],
#   ["Kel Mitchell", "nickelodeon.com"]
# ]

# # Your code should output:
# puts [
#   "pj.hughes@generalassemb.ly",
#   "eric@google.com",
#   "kel.mitchell@nickelodeon.com",
# ]

name_email = [
	["PJ Hughes", "generalassemb.ly"],
    ["Eric Schmidt", "google.com"],
    ["Kel Mitchell", "nickelodeon.com"]
 ]

predictions = []
count = 0

while count < name_email.length
	name_email.each do |x|
		full_name = x[0].split(" ")
		first_name = full_name[0].downcase
		last_name = full_name[1].downcase
		domain = x[1]

		if domain == "generalassemb.ly"
			max_pattern = domain_pattern["generalassemb.ly"][0].max_by{|k, v| v}[0]
		elsif domain == "google.com"
			max_pattern = domain_pattern["google.com"][0].max_by{|k, v| v}[0]
		elsif domain == "nickelodeon.com"
			max_pattern = domain_pattern["nickelodeon.com"][0].max_by{|k, v| v}[0]
		end
		if max_pattern == :a
			prediction = "#{first_name}.#{last_name}@#{domain}"
		elsif max_pattern == :b
			prediction = "#{first_name}@#{domain}"
		elsif max_pattern == :c
			prediction = "#{first_name}#{last_name}@#{domain}"
		elsif max_pattern == :d
			prediction = "#{first_name[0]}#{last_name}@#{domain}"
		elsif max_pattern == :e
			prediction = "No predictable pattern"
		end
		predictions << prediction
		count += 1
	end
end

puts predictions