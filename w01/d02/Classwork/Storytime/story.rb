story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

# line = 0
# desire = "yes"

# while line <= 4 && desire = "yes"
# if line <= 3
# 	puts story[line]
# 	puts "Do you want to continue?"
# 	desire = gets.chomp

# elsif line == 4
# 	puts story[line]
# 	puts "The End"
# end
# end

#=================
line = 0
desire = "yes"

while line <= 3 && desire == "yes"
	puts story[line]
	puts "Do you want to continue?"
	desire = gets.chomp
	line += 1
end

if line == 4 && desire == "yes"
	# puts story[line]
# 	puts "Do you want to continue?"
# 	desire = gets.chomp
# if desire == "yes"
	puts "Too bad for you"
#	line += 1
end


