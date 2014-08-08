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

names = []
counter = 0

while names_emails.length > counter

split_names = names_emails[counter][0].split(" ")
names << split_names
	
counter += 1

end

emails = []
counter_2 = 0 

while names_emails.length > counter_2

split_emails = names_emails[counter_2][1].split("@")
emails << split_emails
	
counter_2 += 1

end

patterns = {
  "generalassemb.ly" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "google.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
  "nickelodeon.com" => {a: 0, b: 0, c: 0, d: 0, e: 0},
}


counter_3 = 0

while counter_3 < emails.length
  if  emails[counter_3][1] == "generalassemb.ly" 
  if (names[counter_3][0] + "." + names[counter_3][1]).downcase == emails[counter_3][0]   
   patterns["generalassemb.ly"][:a] += 1
  elsif (names[counter_3][0]).downcase == emails[counter_3][0]
    patterns["generalassemb.ly"][:b] += 1
  elsif (names[counter_3][0] + names[counter_3][1]).downcase == emails[counter_3][0]
  patterns["generalassemb.ly"][:c] += 1
  elsif (names[counter_3][0][0] + names[counter_3][1]).downcase == emails[counter_3][0]
   patterns["generalassemb.ly"][:d] += 1
  else
   patterns["generalassemb.ly"][:e] += 1
  end
  end
  counter_3 += 1

end

counter_4 = 0


while counter_4 < emails.length
  if emails[counter_4][1] == "nickelodeon.com" 
  if (names[counter_4][0] + "." + names[counter_4][1]).downcase == emails[counter_4][0]   
  patterns["nickelodeon.com"][:a] += 1
  elsif (names[counter_4][0]).downcase == emails[counter_4][0]
    patterns["nickelodeon.com"][:b] += 1
  elsif (names[counter_4][0]+ names[counter_4][1]).downcase == emails[counter_4][0]
   patterns["nickelodeon.com"][:c] += 1
  elsif (names[counter_4][0][0] + names[counter_4][1]).downcase == emails[counter_4][0]
   patterns["nickelodeon.com"][:d] += 1
  else
  puts patterns["nickelodeon.com"][:e]
   patterns["nickelodeon.com"][:e] += 1
  end
  end
  counter_4 += 1
 end

counter_5 = 0

while counter_5 < emails.length
  if emails[counter_5][1] == "google.com" 
  if (names[counter_5][0] + "." + names[counter_5][1]).downcase == emails[counter_5][0]  
   patterns["google.com"][:a] += 1
  elsif (names[counter_5][0]).downcase == emails[counter_5][0]
  patterns["google.com"][:b] += 1
  elsif (names[counter_5][0]+ names[counter_5][1]).downcase == emails[counter_5][0]
  patterns["google.com"][:c] += 1
  elsif (names[counter_5][0][0] + names[counter_5][1]).downcase == emails[counter_5][0]
  patterns["google.com"][:d] += 1
  else
    patterns["google.com"][:e] += 1
  end
  end
  counter_5 += 1
  end

puts patterns