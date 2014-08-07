# Part 2 - Prediction

name_domain = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

email = []

i = 0

while i < name_domain.length
	if name_domain[i][1] == "generalassemb.ly" || name_domain[i][1] == "nickelodeon.com"
		front_domain = name_domain[i][0].gsub(" ", ".").downcase
		back_domain = "@" + name_domain[i][1]
		email << front_domain + back_domain

	else name_domain[i][1] == "google.com"
		front_domain = name_domain[i][0].split(" ")[0].downcase
		back_domain = "@" + name_domain[i][1]
		email << front_domain + back_domain
	end
		i += 1
end

puts email