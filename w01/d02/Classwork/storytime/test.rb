story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]
count = story.count
proceed=true
stop=false
i = 0
while i < count && stop != true
	puts story[i]
	puts "do you want the next line?"
	nextline= gets.chomp
	if nextline == "yes"
puts story [i]
elsif nextline==yes
	puts "no more story"
	stop=true
elsif count == i
	proceed=false

end
i += 1
end