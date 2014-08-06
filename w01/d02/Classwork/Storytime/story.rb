story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]
index=0
puts story[index]

puts("do you want to continue")
answer = gets.chomp.downcase
while answer == "yes" && index < 3
		index += 1
		puts story[index]
	unless index == 3
		puts("do you want to continue")
		answer = gets.chomp.downcase
	end
end



puts "Goodbye!"



