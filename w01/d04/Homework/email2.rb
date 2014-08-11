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
tally = {
	"generalassembly" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
	"google" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
	"nickelodeon" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
}

x = 0
while x < names_emails.length
	namepair = names_emails[x][0].split(" ")
	firstname = namepair[0].downcase
	first_all_letters = firstname.split("")
	firstinit = first_all_letters[0]
	lastname = namepair[1].downcase 
	addresspair = names_emails[x][1].split("@")
	addressname = addresspair[0]

	if addresspair[1] == "generalassemb.ly"
		if firstname + "." + lastname == addressname
			tally["generalassembly"][0][:a] +=1
		elsif firstname == addressname
			tally["generalassembly"][0][:b] +=1
		elsif firstname + lastname == addressname
			tally["generalassembly"][0][:c] +=1
		elsif firstinit + lastname == addressname
			tally["generalassembly"][0][:d] +=1
		else 
			tally["generalassembly"][0][:e] +=1
		end
	end
	if addresspair[1] == "google.com"
		if firstname + "." + lastname == addressname
			tally["google"][0][:a] +=1
		elsif firstname == addressname
			tally["google"][0][:b] +=1
		elsif firstname + lastname == addressname
			tally["google"][0][:c] +=1
		elsif firstinit + lastname == addressname
			tally["google"][0][:d] +=1
		else 
			tally["google"][0][:e] +=1
		end
	end
	if addresspair[1] == "nickelodeon.com"
		if firstname + "." + lastname == addressname
			tally["nickelodeon"][0][:a] +=1
		elsif firstname == addressname
			tally["nickelodeon"][0][:b] +=1
		elsif firstname + lastname == addressname
			tally["nickelodeon"][0][:c] +=1
		elsif firstinit + lastname == addressname
			tally["nickelodeon"][0][:d] +=1
		else 
			tally["nickelodeon"][0][:e] +=1
		end
	end
x += 1
end
puts tally

