items=["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

puts items

index=0

puts "Would you like to order?"
more =gets.chomp.downcase

while more=="yes"
puts "What would you like to order?"
answer=gets.chomp
if answer.include? items[0] 
	index +=1
elsif answer.include? items[1] 
	index +=2
elsif answer.include? items[2] 
	index +=3
elsif answer.include? items[3] 
	index +=4
elsif answer.include? items[4] 
	index +=5
elsif answer.include? items[5] 
	index +=6
elsif answer.include? items[6] 
	index +=7
elsif answer.include? items[7] 
	index +=8
elsif answer.include? items[8]
	index +=9
else puts "That is not on the menu"
end
puts "Would you like to order anything else?"
more = gets.chomp.downcase
if more =="no" 
	puts "Your order will take #{index} minutes"
end
end

puts "Have a great day!"