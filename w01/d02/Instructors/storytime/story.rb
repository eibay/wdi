story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

#Tell the story line by line to the user
#Ask them after each line if they want to continue
#If they say no, stop telling the story
#If they say yes, read the next line


	counter = 0
	decide = "yes"

while decide == "yes" && counter < 4
	put story[counter]
	put 'would you like me to continue telling the story'
	decide = gets.chomp.downcase
	counter += 1
end

if decide == "no"
	puts "Guess you don't want to continue"

end
