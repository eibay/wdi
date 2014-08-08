

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

=begin
i = 0
answer = ""

while (i < 4 && answer != "no")
	puts story[i]
	puts "Cotinue?"
	answer = gets.chomp.downcase
	if answer == "yes"
	else 
		puts "End"
	end
	i += 1
end
=end

i = 0

while i < 4
	puts story[i]
	puts "continue?"
	user_input = gets.chomp

	if user_input == "yes"
		i += 1
	else
		i += 5
		puts "The End"
	end
end



#if continue
#	i += 1
#	puts story[i]
#enddr




=begin
i = 0


puts story[i]
puts "Continue?"
user_input = gets.chomp

while i <=4 && user_input == "yes"
	puts story = story[i]



	continue = true
end

if continue 
	puts story = story[+ 1]
	puts "Continue?"
	user_input = gets.chomp
else
	puts "end"
end
=end








=begin
index = 0

while index <= 4
	if user_input == "yes"
	index = index + 1
	continue = true
end
end


if continue
	puts story[index]
else
	puts "end"
end

=end







