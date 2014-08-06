trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

 
index=0
puts items
puts "Would you like to add an item?"
add=gets.chomp.downcase


while index < 6 && add=="yes"
puts "What would you like to add?"
answer=gets.chomp
if answer.include? items[0] 
	trunk << answer
	index +=1
elsif answer.include? items[1] 
	trunk << answer
	index +=1
elsif answer.include? items[2] 
	trunk << answer
	index +=1
elsif answer.include? items[3] 
	trunk << answer
	index +=1
elsif answer.include? items[4] 
	trunk << answer
	index +=1
elsif answer.include? items[5] 
	trunk << answer
	index +=1
elsif answer.include? items[6] 
	trunk << answer
	index +=1
else puts "This is not an item, Try again"
end

puts "Would you like to add an item?"
add=gets.chomp.downcase
end
if index==6
print "#{trunk} is in your trunk and it is full "
else print "Bye #{trunk} is in your trunk"
end





	




	








