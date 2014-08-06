story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

# Tell the story line by line to the user 
# Ask them after each line if they want to continue
# If they say no, stop telling the story
# If they say yes, read the next line

# Use a 'while' loop

user_response = "yes"
index = 0

while user_response == "yes" && index <=3
	puts story[index]
	index += 1

	if index <= 3 
		#have to say this because it will be 4 after the last index+=1
		puts "Do you want to continue?"
		user_response = gets.chomp
	end
end


=begin

while user_response == "yes" && index <=3
	puts story[index]
	puts "Do you want to continue?"
	user_response = gets.chomp
	if user_response == "yes" [THIS IS REDUNDANT, BECAUSE THE LARGER 
	LOOP IS ONLY WORKING IF USER RESPONSE == YES]
		index += 1
	end
end	

=end



=begin

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

index = 0
puts story[index]
puts ("Do you want to continue?")
answer = gets.chomp.downcase
while answer == "yes" and index <4
	index += 1
	puts story[index]
	puts ("Do you want to continue?")
	answer = gets.chomp.downcase
end

puts ("Goodbye")

=end



	
