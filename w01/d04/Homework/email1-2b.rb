#this doesn't work. I gather from Ben that it would be good to reconfigure the 
#structure so the first question is what company/domain, then the details.



name_email = [ 
	 ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
	 ["Neel Patel", "neel.patel@generalassemb.ly"],
	 ["Sean West", "sean.west@generalassemb.ly"],
	 ["Jake Schwartz", "j@generalassemb.ly"],
	 # ["Brad Jacobs", "brad@google.com"],
	 # ["Cynthia Silvers", "cynthia@google.com"],
	 # ["Summer Sanders", "summer.sanders@nickelodeon.com"],
	 # ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
 ]

#initial values of pattern matches are 0

pattern_matches = {
  "generalassemb.ly" => {a: 0, b: 0, c: 0, d: 0},			
  "google.com" => {a: 0, b: 0, c: 0, d: 0},
  "nickelodeon.com" => {a: 0, b: 0, c: 0, d: 0},
}

x = 0
# t = true

while x < name_email.length 
			
	#to split the data
	name = name_email[x][0]
	email = name_email[x][1]
	first_name = name.split(" ")[0].downcase
	last_name = name.split(" ")[1].downcase
	prefix = email.split("@")[0]
	
		if email == "generalassemb.ly" && prefix == "#{first_name}.#{last_name}" #compare prefix == expected pattern
		pattern_hash = pattern_matches['generalassemb.ly']
		pattern = pattern_hash[:a] 
		pattern += 1
		puts "hit"
		x += 1

		elsif email == "generalassemb.ly" && prefix == "#{first_name}"
		pattern_hash = pattern_matches['google.com']
		pattern = pattern_hash[:b] 
		pattern += 1
		puts "hit"
		x += 1


		else email == "generalassemb.ly" && prefix == "#{first_name}#{last_name}"
		pattern_hash = pattern_matches['nickelodeon.com']
		pattern = pattern_hash[:c] 
		pattern += 1
		puts "hit"
		x += 1


	# if email == "google.com"
	# if email == "nickelodeon.com"
		
		end
end

puts pattern_matches