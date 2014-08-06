
story = ['Fry is born without a delta brainwave', 'As a result, Fry is cryogenically frozen until 2999', 'In the future, Fry works on a spaceship', 'The spaceship hits a wormhole and crashes in 1941 Roswell, NM']

user_response = "yes"
index = 0

while user_response == "yes" && index <= 3
	puts story[index] 
	user_response = gets.chomp.downcase

    index = index + 1

end



# Tell the story line by line to the user
# Ask them after each line if they want to continue
# If they say no stop telling the story
# If they say yes, read the next line
