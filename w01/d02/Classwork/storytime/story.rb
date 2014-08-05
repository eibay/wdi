story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

# story = [1,2,3,4]

index = 0
user = 'y'


puts "Here is a story:"
puts

while user == 'y' && index < (story.length) 
	puts story[index]

	if index < story.length - 1
		puts "Continue? [y] [n]"
		user = gets.chomp.downcase
	end

	index += 1
end






