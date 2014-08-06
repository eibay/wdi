story = ['Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',]

index = 0
answer = "yes"

while (index < story.length) && answer == "yes" 
	puts story[index]
	unless index == 3
	puts "Do you want me to continue?"
	answer = gets.chomp
	end	
		
		if answer == "yes"
			index = index += 1 
		else 
			answer == "no"
			puts "Fine, then, I'll stop"
		end
	end