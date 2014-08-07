story_array = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

line = 0
desire = "Yes"

while (line <=2) && (desire == "Yes")
  puts story_array[line]
  puts "Do you want to read more? Yes or No"
  desire = gets.chomp
  line = line + 1
end

# while (index ==3) && (input == "Yes")
# 	puts story[index]
# 	puts "The End"
# 	index = index + 1

# end

if (line ==3) && (desire == "Yes")
	puts story_array[line]
	puts "The End"

end