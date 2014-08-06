story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

# use while loop
# tell the story line by line to the user
# ask them after each line if they want to continue
# if they say no, stop telling the story
# if they say yes, read the next line.

# Boring tedious version - wouldn't be practical if we had 1000000 lines
# puts story[0]
# puts story[1]
# puts story[2]
# puts story[3]

index = 0

while index < 4
	puts story[index]
	index = index + 1

	puts "Do you want to continue?"	
end

