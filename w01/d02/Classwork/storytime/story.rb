story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]


# ####### WHILE LOOP #######
# n = 0
# while n < 3 do
# 	puts story[n]
# 	puts "do you want to hear more?"
# 	ans = gets.chomp.downcase
# 	if ans == "yes" || ans == "y"
# 		n += 1
# 	elsif ans == "no" || ans == "n"
# 		n = 3
# 		puts "okay..."
# 	else
# 		puts "English, do you speak it??"
# 		n = 3
# 	end

# 	if n == 3
# 		puts story[n]
# 	end
# end

######### class style ########

# n = 0
# ans = "yes"
# while (n < 3 && ans == "yes") do
# 	puts story[n]
# 	n += 1
# 	puts "do you want to hear more?"
# 	ans = gets.chomp.downcase

# 	if n == 3
# 		puts story[n]
# 	end
# end




# ####### EACH LOOP ########

story.each do |x|
	puts x
	puts "do you want to hear more?"
	ans = gets.chomp.downcase
	if ans == "yes" || ans == "y"
	elsif ans == "no" || ans == "n"
		puts "okay..."
	else
		puts "English, do you speak it??"
	end
	
end



# ####### UNTIL LOOP #######
# n = 0
# until n == 3 do
# 	puts story[n]
# 	puts "do you want to hear more?"
# 	ans = gets.chomp.downcase
# 	if ans == "yes" || ans == "y"
# 		n += 1
# 	elsif ans == "no" || ans == "n"
# 		n = 3
# 		puts "okay..."
# 	else
# 		puts "English, do you speak it??"
# 		n = 3
# 	end

# end

# if n == 3
# 	puts story[n]
# end
