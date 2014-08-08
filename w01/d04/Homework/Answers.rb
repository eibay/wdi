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




names = [ ]
counter = 0
while counter < names_emails.length
	namesfirst = names_emails[counter][0].split(" ")
	names << namesfirst
	counter += 1
end


emails = [ ]
looper = 0
while looper < names_emails.length
	emailsfirst = names_emails[looper][1].split("@")
	emails << emailsfirst
	looper += 1
end


patterns = {
  "generalassemb.ly" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "google.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "nickelodeon.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
}

counter_two = 0


while counter_two < emails.length

	if  emails[counter_two][1] == "generalassemb.ly" 
		if (names[counter_two][0] + "." + names[counter_two][1]).downcase == emails[counter_two][0] 	
	 	patterns["generalassemb.ly"][:a] += 1
 		elsif (names[counter_two][0]).downcase == emails[counter_two][0]
  		patterns["generalassemb.ly"][:b] += 1
		elsif (names[counter_two][0] + names[counter_two][1]).downcase == emails[counter_two][0]
		patterns["generalassemb.ly"][:c] += 1
 		elsif (names[counter_two][0][0] + names[counter_two][1]).downcase == emails[counter_two][0]
 	 	patterns["generalassemb.ly"][:d] += 1
 		else
 	 	patterns["generalassemb.ly"][:e] += 1
 		end
 	end
	counter_two += 1
 end

counterfour = 0

while counterfour < emails.length
	if emails[counterfour][1] == "nickelodeon.com" 
		if (names[counterfour][0] + "." + names[counterfour][1]).downcase == emails[counterfour][0] 	
		patterns["nickelodeon.com"][:a] += 1
 		elsif (names[counterfour][0]).downcase == emails[counterfour][0]
  		patterns["nickelodeon.com"][:b] += 1
		elsif (names[counterfour][0]+ names[counterfour][1]).downcase == emails[counterfour][0]
	 	patterns["nickelodeon.com"][:c] += 1
 		elsif (names[counterfour][0][0] + names[counterfour][1]).downcase == emails[counterfour][0]
 	 	patterns["nickelodeon.com"][:d] += 1
 		else
 		puts patterns["nickelodeon.com"][:e]
 	 	patterns["nickelodeon.com"][:e] += 1
		end
 	end
 	counterfour += 1
 end

counterthree = 0

while counterthree < emails.length
	if emails[counterthree][1] == "google.com" 
		if (names[counterthree][0] + "." + names[counterthree][1]).downcase == emails[counterthree][0] 	
	 	patterns["google.com"][:a] += 1
 		elsif (names[counterthree][0]).downcase == emails[counterthree][0]
 		patterns["google.com"][:b] += 1
		elsif (names[counterthree][0]+ names[counterthree][1]).downcase == emails[counterthree][0]
		patterns["google.com"][:c] += 1
 		elsif (names[counterthree][0][0] + names[counterthree][1]).downcase == emails[counterthree][0]
 		patterns["google.com"][:d] += 1
 		else
  		patterns["google.com"][:e] += 1
 		end
	end
 	counterthree += 1
end

puts patterns

