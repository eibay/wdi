namesbefore = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]
name = []
emails =[]

counter_1 = 0
while counter_1 < namesbefore.length
	names = namesbefore[counter_1][0].split(" ")
	name << names
	counter_1 += 1
end

counter = 0
while  counter < namesbefore.length 
	if namesbefore[counter][1] == "generalassemb.ly"
	emails << (name[counter][0] + "." +name[counter][1]).downcase + "@generalassemb.ly"
	end
	counter += 1
end 

counter1 = 0
while counter1 < namesbefore.length
if namesbefore[counter1][1] == "nickelodeon.com"
	emails << (name[counter1][0] + "." + name[counter1][1]).downcase + "@nickelodeon.com"
	end
	counter1 +=1
end 

counter2 = 0
while counter2 < namesbefore.length
	if namesbefore[counter2][1] == "google.com"
	emails << (name[counter2][0]).downcase + "@google.com"
	end
	counter2 += 1
end 

puts emails