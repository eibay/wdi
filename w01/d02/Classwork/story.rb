story = ['Fry is born without a delta brainwave',
	'As a result, Fry is cryogenically frozen until 2999',
	'In the future, Fry works on a spaceship', 'The spaceship hits a wormhole and crashes in 1941 Roswell, NM']

#Tell the story line by line to the user
#Ask them after each line if they want to continue
#If they say no, stop telling the story
#If they say yes, read the next line



 index = 0

puts story[index]
puts "Would you like to read a story?"
input = gets.chomp.downcase

while index <= 3 && (input == 'yes') || (input == 'y') || (input == 'yeess')
 	index = index + 1 
 	puts story[index]
 	if index >=3 
 		puts "The End"
 	else
 	input = gets.chomp.downcase
 end

end

# if input == yeess do |x|
# 	x = story.new("And Zoidberg explodes...")
# else

puts "The End"