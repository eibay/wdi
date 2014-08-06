story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

index = 0

puts story[index]
puts "Do you want to continue? Yes or No?"
answer = gets.chomp.downcase


while index < 3 && answer == "yes"
	index = index + 1 
	puts story[index] 
	puts "Continue?" unless index <= 3
	answer = gets.chomp.downcase
end
end

Puts "Bye!"