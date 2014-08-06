story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

<<<<<<< HEAD
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
=======
# Tell the story line by line to the user
# Ask them after each line if they want to continue
# If they say no, stop telling the story
# If they say yes, read the next line

index = 0
continue = "yes"

while index < 4 && continue == "yes"
  puts story[index]
  index = index + 1

  if index < 4
    puts "Would you like to continue the story?"
    continue = gets.chomp
  end
>>>>>>> 04f24622f50f62856a43a6ea13f012e2629d0bb3
end