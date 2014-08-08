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
	"generalassemb.ly" => {a: 0, b: 0, c: 0, d: 0, e: 0},
	"google.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
	"nickelodeon.com" => {a: 0, b: 0, c: 0, d: 0, e: 0}
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
		email = :b
	elsif screen_name == c
		email = :c
	elsif screen_name == d
		email = :d
	else
		email = :e
	end

	# binding.pry
	if domain_name == "generalassemb.ly"
		email_hash["generalassemb.ly"][email] += 1
	elsif domain_name == "google.com"
		email_hash["google.com"][email] += 1
	elsif domain_name == "nickelodeon.com"
		email_hash["nickelodeon.com"][email] += 1
	end

	index += 1
end

puts email_hash 





