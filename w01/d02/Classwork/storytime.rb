story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]






index = 0
continue = "yes"

while continue == "yes" && (index < story.length)
	puts story[index]
	unless index == 3

	puts "do you want to continue?"	
	continue = gets.chomp
end

	if continue == "yes"
	index += 1
		else
			puts "You dont like my story?"
	end




end