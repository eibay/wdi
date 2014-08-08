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


gaa = 0
gab = 0
gac = 0
gad = 0
gae = 0

goa = 0 
gob = 0
goc = 0
god = 0
goe = 0

nia = 0
nib = 0
nic = 0
nid = 0
nie = 0

looper = 0

while looper < names_emails.length

name_space_split = names_emails[looper][0].split(" ")
name_squeeze = name_space_split[0] + name_space_split[1]
first_initial_last = name_space_split[0][0] + name_space_split[1]
email_dot_split = names_emails[looper][1].split(".")

email_at_split = names_emails[looper][1].split("@")

if email_at_split[1] == "generalassemb.ly"
	if (name_space_split.length + 1 == email_dot_split.length) && (name_space_split[0].downcase == email_dot_split[0].downcase)
		gaa += 1
		looper += 1
	elsif name_space_split[0].downcase == email_at_split[0].downcase
		gab += 1
		looper += 1
	elsif name_squeeze.downcase == email_at_split[0]
		gac += 1
		looper += 1
	elsif first_initial_last.downcase == email_at_split[0].downcase
		gad += 1
		looper += 1
	else
 		gae += 1
 		looper += 1
	end
elsif email_at_split[1] == "google.com"
	if (name_space_split.length + 1 == email_dot_split.length) && (name_space_split[0].downcase == email_dot_split[0].downcase)
		goa += 1
		looper += 1
	elsif name_space_split[0].downcase == email_at_split[0].downcase
		gob += 1
		looper += 1
	elsif name_squeeze.downcase == email_at_split[0]
		goc += 1
		looper += 1
	elsif first_initial_last.downcase == email_at_split[0].downcase
		god += 1
		looper += 1
	else
 		goe += 1
 		looper += 1
	end
elsif email_at_split[1] == "nickelodeon.com"
	if (name_space_split.length + 1 == email_dot_split.length) && (name_space_split[0].downcase == email_dot_split[0].downcase)
		nia += 1
		looper += 1
	elsif name_space_split[0].downcase == email_at_split[0].downcase
		nib += 1
		looper += 1
	elsif name_squeeze.downcase == email_at_split[0]
		nic += 1
		looper += 1
	elsif first_initial_last.downcase == email_at_split[0].downcase
		nid += 1
		looper += 1
	else
 		nie += 1
 		looper += 1
	end
	
else
	looper += 1
end
end

ga = {a: gaa, b: gab, c: gac, d: gad, e: gae}
goo = {a: goa, b: gob, c: goc, d: god, e: goe}
nick = {a: nia, b: nib, c: nic, d: nid, e: nie}



email_tallies = {"generalassemb.ly" => ga, "google.com" => goo, "nickelodeon.com" => nick}

best_ga_choice = email_tallies["generalassemb.ly"].each { |k, v| puts k if v == email_tallies["generalassemb.ly"].values.max }
best_goo_choice = email_tallies["google.com"].each { |k, v| puts k if v == email_tallies["google.com"].values.max } 
best_nick_choice = email_tallies["nickelodeon.com"].each { |k, v| puts k if v == email_tallies["nickelodeon.com"].values.max } 
puts(best_ga_choice)
puts(best_goo_choice)
puts(best_nick_choice)

test_emails = [["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]]
final_email_list = []


def email_test_loop(hash_name, best_choice)
 test_looper = 0
while test_looper < test_emails.length
if test_emails[test_looper][1] == hash_name
if best_choice == "a"
	first_dot_last = test_emails[test_looper][0].split(" ")
	email_first_dot_last = first_dot_last[0] + "." + first_dot_last[1] + "@" + test_emails[test_looper][1]
	return email_first_dot_last
	test_looper += 1	
elsif best_choice == "b"
	first_name = test_emails[test_looper][0].split(" ")
	email_first_name = first_name[0] + "@" + test_emails[test_looper][1]
	return email_first_name
	test_looper += 1
elsif best_choice == "c"
	first_last = test_emails[test_looper][0].split(" ")
	email_first_last = first_name[0] + first_name[1] + "@" + test_emails[test_looper][1]
	return email_first_last
	test_looper += 1
elsif best_choice == "d"
	first_initial = test_emails[test_looper][0].split(" ")
	email_first_initial = first_initial[0][0] + first_initial[1] + "@" + test_emails[test_looper][1]
	return email_first_initial
	test_looper += 1
else best_choice == "e"
	return puts("Cannot predict")
	test_looper += 1
end
end
end

final_email_list.push(email_test_loop("generalassemb.ly", best_ga_choice))

final_email_list.push(email_test_loop("google.com", best_goo_choice))
final_email_list.push(email_test_loop("nickelodeon.com", best_nick_choice))



