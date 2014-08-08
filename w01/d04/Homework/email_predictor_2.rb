require 'pry'

names_pair = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]
name = []
emails =[]

counter_1 = 0
while counter_1 < names_pair.length
  names = names_pair[counter_1][0].split(" ")
  name << names
  counter_1 += 1
end


counter_2 = 0
while  counter_2 < names_pair.length 
  if names_pair[counter_2][1] == "generalassemb.ly"
  emails << (name[counter_2][0] + "." +name[counter_2][1]).downcase + "@generalassemb.ly"
  end
  counter_2 += 1
end 

counter_3 = 0
while counter_3 < names_pair.length
if names_pair[counter_3][1] == "nickelodeon.com"
  emails << (name[counter_3][0] + "." + name[counter_3][1]).downcase + "@nickelodeon.com"
  end
  counter_3 +=1
  end 

counter_4 = 0

while counter_4 < names_pair.length
  if names_pair[counter_4][1] == "@google.com"
  emails << (name[counter_4][0]).downcase + "google.com"
  end
  counter_4 += 1
end 

puts emails