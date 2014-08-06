trunk = []

items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

specific_item = 0										#start with index 0
desire = "yes"

while (specific_item <=5) && (desire == "yes") 			#while looking at 0-5 items
	puts "add to the trunk?"							#asks if you want to add
	desire = gets.chomp									#response whether to add

	if desire == "yes"									#if response is yes
		trunk[specific_item]=items[specific_item] 		#specificitems will be iterated
		specific_item = specific_item + 1				#this is the iteration up by 1
		puts "#{trunk} now in the trunk"				#prints elements deposited in trunk
	else puts "Okay."									#if answer not "yes" then prints "okay"
	end

	if specific_item >=6								#if iteration reaches past 7 items
		puts "Sorry. The trunk is now full! " "#{trunk}"  		#prints warning and stops
	end
end



#does the limited job and is ugly
#can user select items?
#how to print array contents as I'd like?
