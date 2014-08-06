story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

proceed = true
stop = false
line = 0

while (proceed && line < story.length && !stop)
	puts story[line]
	unless line == story.length - 1
		puts "Next line? Y/N"
		next_line = gets.chomp.upcase
		if next_line == "Y" 
			proceed = true
		else
			puts "End of story"
			stop = true
		end
	else 
		puts "The End"
	end
	line += 1
end