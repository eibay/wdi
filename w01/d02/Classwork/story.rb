 story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]


index = 0
user = 'yes'

puts "Here is a story:"
puts
while user == 'yes' && index < story.length
	puts story[index]

	puts "Continue? Yes or No"
	user = gets.chomp.downcase

	if index >= (story.length) -1
		puts "finish"
end

index += 1
end


