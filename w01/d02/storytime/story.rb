story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

i = 0
answer = ""

# story.each do |title|
# 	puts story[i]
# 	puts "You wanna continue?"
# 	answer = gets.chomp.downcase
# 	if answer == "yes"
# 		i += 1
# 	else
# 		puts "Stop telling the story"
# 	end
# end

# i = 0

while (i < 4 && answer != "no") 
	puts story[i]
	puts "You wanna continue?"
	answer = gets.chomp.downcase
	if answer == "no"
		puts "Stop telling the story"
	end
	i += 1
end