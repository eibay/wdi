trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

 
counter=0
puts items
puts "Would you like to add an item?"
add=gets.chomp.downcase


while counter < 6 && add=="yes"
puts "What would you like to add?"
answer=gets.chomp

# index_of_items= items.index(answer)
if items.include? answer
counter += 1
trunk << (answer) # if the trunk array was in the loop could do while trunk.length < 6
else puts "This is not an item"
end

# if answer.include? items[0] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[1] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[2] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[3] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[4] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[5] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[6] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[7] 
# 	trunk << answer
# 	index +=1
# elsif answer.include? items[8] 
# 	trunk << answer
# 	index +=1
# else puts "This is not an item, Try again"
# end

puts "Would you like to add an item?"
add=gets.chomp.downcase
end
if counter=6
print "#{trunk} is in your trunk and it is full "
else print "Bye #{trunk} is in your trunk"
end





	




	








