story = ['Fry is born without a delta brainwave','As a result, Fry is cryogenically frozen until 2999','In the future, Fry works on a spaceship','The spaceship hits a wormhole and crashes in 1941 Roswell, NM']

# Tell the story line by line to the user
# Ask them after each line if they want to continue
# If they say no, stop telling the story
# If they say yes, read the next line

index = 0
user_response = gets.chomp

while (user_response == "Yes" && index < 4)
  puts story[index]
	puts "Shall I continue?"
	  user_response = gets.chomp
	if user_response == "No" || story.length > 3
	  puts "Okay, some other time then!"
	end
	index += 1
end
