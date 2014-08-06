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

index = 0
continue = "yes"

while index < 4 && continue == "yes"
  puts story[index]
  index = index + 1

  if index < 4
    puts "Would you like to continue the story?"
    continue = gets.chomp
  end
end