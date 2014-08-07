
# Part 1 - Classification

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

hash = {
  "generalassemb.ly" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "google.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
}

i = 0

while (i < names_emails.length && names_emails[i][1].include?("generalassemb.ly"))
	if names_emails[i][1].split("@")[0] == names_emails[i][0].split(" ")[0].downcase + "." + names_emails[i][0].split(" ")[1].downcase
		hash["generalassemb.ly"][0][:a] += 1
	elsif names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].downcase)
		hash["generalassemb.ly"][0][:b] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0]) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["generalassemb.ly"][0][:c] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].chr) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["generalassemb.ly"][0][:d] += 1
	else
		hash["generalassemb.ly"][0][:e] += 1
	end
	i += 1
end

while (i < names_emails.length && names_emails[i][1].include?("google.com"))
	if names_emails[i][1].split("@")[0] == names_emails[i][0].split(" ")[0].downcase + "." + names_emails[i][0].split(" ")[1].downcase
		hash["google.com"][0][:a] += 1
	elsif names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].downcase)
		hash["google.com"][0][:b] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0]) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["google.com"][0][:c] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].chr) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["google.com"][0][:d] += 1
	else
		hash["google.com"][0][:e] += 1
	end
	i += 1
end

while (i < names_emails.length && names_emails[i][1].include?("nickelodeon.com"))
	if names_emails[i][1].split("@")[0] == names_emails[i][0].split(" ")[0].downcase + "." + names_emails[i][0].split(" ")[1].downcase
		hash["nickelodeon.com"][0][:a] += 1
	elsif names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].downcase)
		hash["nickelodeon.com"][0][:b] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0]) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["nickelodeon.com"][0][:c] += 1
	elsif (names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[0].chr) && names_emails[i][1].split("@")[0].include?(names_emails[i][0].split(" ")[1]))
		hash["nickelodeon.com"][0][:d] += 1
	else
		hash["nickelodeon.com"][0][:e] += 1
	end
	i += 1
end

puts hash