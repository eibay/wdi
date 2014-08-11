modal_patterns = {
  "generalassemb.ly" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "google.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "nickelodeon.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
}


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

n = 0 
whole_names =[]
whole_emails = []

while n < names_emails.length	
	whole_names.push(names_emails[n][0].split(" "))
	whole_emails.push(names_emails[n][1].split("@"))
	n += 1
end

first_names = []
last_names = []
addresses = []
domains = []

n = 0
while n < names_emails.length
	first_names.push(whole_names[n][0])
	last_names.push(whole_names[n][1])
	addresses.push(whole_emails[n][0])
	domains.push(whole_emails[n][1])
	n += 1
end

n = 0
while n < names_emails.length
	first_names[n].downcase!
	last_names[n].downcase!
	n += 1
end

n = 0
initials = []

while n < names_emails.length
	initials.push(first_names[n].split(""))
	n += 1
end

domain_options = ["generalassemb.ly", "google.com", "nickelodeon.com"]

x = 0 
y = 0

pattern_a = "#{first_names[x]}.#{last_names[x]}" 
pattern_b = "#{first_names[x]}"
pattern_c = "#{first_names[x]}#{last_names[x]}"
pattern_d = "#{initials[x][0]}#{last_names}[x]" 

while x < names_emails.length || y < domain_options.length
 	if (addresses[x] == pattern_a) && (domains[x] == domain_options[y])
		modal_patterns[domain_options[y]][:a] += 1
	elsif (addresses[x] == pattern_b) && (domains[x] == domain_options[y])
		modal_patterns[domain_options[y]][:b] += 1
	elsif (addresses[x] == pattern_c) && (domains[x] == domain_options[y])
		modal_patterns[domain_options[y]][:c] += 1
	elsif (addresses[x] == pattern_d) && (domains[x] == domain_options[y])
		modal_patterns[domain_options[y]][:d] += 1
	else (addresses[x] != (pattern_a || pattern_b || pattern_c || pattern_d)) && (domains[x] == domain_options[y])
		modal_patterns[domain_options[y]][:e] += 1
	end

	x += 1
	y +=1 
end



print modal_patterns
# #Part Two +++++++++++++++++++++++++++++++++++++++

# new_names_domains = [
#   ["PJ Hughes", "generalassemb.ly"],
#   ["Eric Schmidt", "google.com"],
#   ["Kel Mitchell", "nickelodeon.com"]
# ]

# n = 0 
# new_whole_names =[]

# while n < new_names_domains.length	
# 	new_whole_names.push(new_names_domains[n][0].split(" "))
# 	n += 1
# end

# n = 0
# while n < new_names_domains.length
# 	new_whole_names[n].downcase!
# 	n += 1
# end

# new_first_names = []
# new_last_names = []
# new_addresses = []
# new_domains = []

# n = 0
# while n < new_names_domains.length
# 	new_first_names.push(new_whole_names[n][0])
# 	new_last_names.push(new_whole_names[n][1])
# 	n += 1
# end

# n = 0
# new_initials = []

# while n < new_names_domains.length
# 	new_initials.push(new_first_names[n].split(""))
# 	n += 1
# end

# new_pattern_a = "#{new_first_names[x]}.#{new_last_names[x]}" && new_names_domains[x][1]
# pattern_b = "#{first_names[x]}" && domains[x]
# pattern_c = "#{first_names[x]}#{last_names[x]}" && domains[x]
# pattern_d = "#{initials[x][0]}#{last_names}[x]" && domains[x]
# new_names_emails = []
# x = 0
# y = 0

# while x < new_names_domains.length
# 	if new_names_domains[x][1] == domain_options[y]
# 		new_names_emails.push()

		
# 	end



# # a. first.last (ie, jeffrey.konowitch)
# # b. first (ie, jeffrey)
# # c. firstlast (ie, jeffreykonowitch)
# # d. first_initiallast (ie, jkonowitch)
# # e. doesn't match any patterns
