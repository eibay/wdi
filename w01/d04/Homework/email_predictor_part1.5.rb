require 'pry'


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

index = 0

email_hash = {
	"generalassembly.ly" => [],
	"google.com" => [],
	"nickelodeon.com" => []
}

while index < names_emails.length

	user = names_emails[index]
	name = user[0].split(" ")

	f_name = name[0].downcase 
	l_name = name[1].downcase 

	email = user[1].split("@")

	screen_name = email[0]
	domain_name = email[1]


	a = f_name + "." + l_name
	b = f_name
	c = f_name + l_name
	d = f_name[0] + l_name


	if screen_name == a 
		email = :a
	elsif screen_name == b
		email = :a
	elsif screen_name == c
		email = :c
	elsif screen_name == d
		email = :d
	else
		email = :e
	end

binding.pry
	if domain_name == "generalassemb.ly"
		email_hash["generalassemb.ly"].push(email)
	elsif domain_name == "google.com"
		email_hash["google.com"].push(email)
	elsif domain_name == "nickelodeon.com"
		email_hash["nickelodeon.com"].push(email)
	end

	index += 1
end

puts email_hash 





