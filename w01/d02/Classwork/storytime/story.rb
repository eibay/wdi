story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

index = 0
read = "y"

while index < story.length && read == "y"
	puts story[index]
	unless index == story.length - 1
		puts "...would you like to hear the next part of the story?  Please enter y or n"
		read = gets.chomp
	else
		puts "...and that's the end!"
	end
	if read != "y"
		puts "I'm terribly sorry to have bored you."
	else
		index = index + 1
	end
end