story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]




index = 0
input = "yes"
while (index < 4 && input == "yes")
	if index <= 2
		puts("#{story[index]}, continue story?")
		input = gets.chomp.downcase
		index += 1
		if input != "yes"
			puts("he bangs his grandma in the end")
		end
	else
	puts("#{story[index]}. Fin.")
	index += 1
	end
		# if input == "yes"
		# 	index += 1
		# else
		# 	puts("he bangs his grandma in the end")
		# end
end
# while (index == 3 && input == "yes")
# 	puts("#{story[index]}. Fin.")
# 	index += 1
# end
