story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

# tell the story line by line ot the users
# ask them after each line if they want to continue
# if they say no, stop telling the story
# if they say yes, read the next line

story = ["Fly is born without a delta brainwave", 
	"As a result, Fry is cryogenically frozen until 2999", 
	"In the future, Fry works on a spaceship",
	"The spaceship hits a wormhole and crashes in 1941 in Roswell, NM"]

index = 0
response = gets.chomp

while response == "Yes" && index < 4
	puts story[index]
	puts "Would you like to proceed?"
	response = gets.chomp
if response == "No" || index > 3 
	puts "Thanks for reading!"
end
index +=1
end
