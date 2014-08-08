patterns = {
  "generalassemb.ly" => {a: 2, b: 0, c: 0, d: 0, e: 2},
  "google.com" => {a: 0, b: 2, c: 0, d: 0, e: 0},
  "nickelodeon.com" => {a: 2, b: 0, c: 0, d: 0, e: 0},
}
 #patterns from previous exercise

namesbefore = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"],
  ["Tejal Patel", "google.com"]
]

if patterns["generalassemb.ly"].values.max == patterns["generalassemb.ly"][:e]
	puts "General Assembly has no pattern"
else
	genmax = patterns["generalassemb.ly"].key(patterns["generalassemb.ly"].values.max)
end

if patterns["google.com"].values.max == patterns["google.com"][:e]
	puts "Google has no pattern"
else
	goomax = patterns["google.com"].key(patterns["google.com"].values.max)
end

if patterns["nickelodeon.com"].values.max == patterns["nickelodeon.com"][:e]
	puts "Nickelodeon has no pattern"
else
	nicmax = patterns["nickelodeon.com"].key(patterns["nickelodeon.com"].values.max)
end


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
	if genmax == :a
	emails << (name[counter][0] + "." + name[counter][1]).downcase + "@generalassemb.ly"
	elsif genmax == :b
	emails << (name[counter][0]).downcase + "@generalassembly.com"
	elsif genmax == :c
	emails << (name[counter][0] + name[counter][1]).downcase + "@generalassemb.ly"
	 elsif genmax == :d
	emails << (name[counter][0][0]).downcase + "@generalassemb.ly"
	end
	end
	counter += 1
end 

counter1 = 0
while counter1 < namesbefore.length 
	if namesbefore[counter1][1] == "google.com"
	if goomax == :a
	emails << (name[counter1][0] + "." + name[counter1][1]).downcase + "@google.com"
	elsif goomax == :b
	emails << (name[counter1][0]).downcase + "@google.com"
	elsif goomax == :c
	emails << (name[counter1][0] + name[counter1][1]).downcase + "@google.com"
	 elsif goomax == :d
	emails << (name[counter1][0][0]).downcase + "@google.com"
	end
	end
	counter1 +=1
end 

counter2 = 0
while counter2 < namesbefore.length 
	if namesbefore[counter2][1] == "nickelodeon.com"
	if nicmax == :a
	emails << (name[counter2][0] + "." + name[counter2][1]).downcase + "@nickelodeon.com"
	elsif nicmax == :b
	emails << (name[counter2][0]).downcase + "@nickelodeon.com"
	elsif nicmax == :c
	emails << (name[counter2][0] + name[counter2][1]).downcase + "@nickelodeon.com"
	 elsif nicmax == :d
	emails << (name[counter2][0][0]).downcase + "@nickelodeon.com"
	end
	end
	counter2 +=1
end

puts emails