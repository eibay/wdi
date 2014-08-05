story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]


counter = 0
decide = "yes"

while decide == "yes" && counter < 4
	puts story[counter]
	puts 'Would you like me to continue telling the story?'
	decide = gets.chomp.downcase
	counter += 1
end

if decide == "no"
	puts "Guess you don't like my story, bye."
end


	

