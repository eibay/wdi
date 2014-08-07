
######## Beautiful elegant way ######

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

hash = Hash[menu.map.with_index.to_a] #creates hash to assign a value that can be looked up


cooking_time = 0
item = " "
while item != "Done" do #i specify a keyword to end the loop
	puts "what do you want? Type 'Done' when done"
	item = gets.chomp.capitalize 
	puts item
	if item != "Done" #if it is done, then we skip over this because 'done' is not in the hash
		cooking_time = cooking_time + 1 + hash[item] # this updates the n which is the amt of time.
	end

end
puts "order time: " + cooking_time.to_s + " minutes"



######## Beautiful elegant way + bonus ######

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

hash = Hash[menu.map.with_index.to_a] #creates hash to assign a value that can be looked up


cooking_time = 0
downtime = 0
item = " "
while item != "Done" do #i specify a keyword to end the loop
	puts "what do you want? Type 'Done' when done"
	item = gets.chomp.capitalize

	if item != "Done" #if it is done, then we skip over this because 'done' is not in the hash
		cooking_time = cooking_time + 1 + hash[item] # this updates the n which is the amt of time.
		downtime = downtime + 1 #i could have put the change into the cooking time, but i opted to have another variable so that its more transparent what i'm doing and how i'm modelling real life.

	end
	
end
puts "order time: " + (cooking_time + downtime * 0.5 - 0.5).to_s + " minutes"










########### inelegant ugly way ########

#this was my original answer: i knew this would work, but i wasn't sure how to work with hashes.

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = 0
item = 0
while item != "done" do #i specify a keyword to end the loop
	puts "what do you want? Type 'Done' when done"
	item = gets.chomp.downcase

	case item
	when "soda"
		order += 1
	when "fries"
		order += 2
	when "milkshake"
		order += 3
	when "chicken tenders"
		order += 4
	when "hot dog"
		order += 5
	when "hamburger"
		order += 6
	when "chickeen sandwich"
		order += 7
	when "double Cheeseburger"
		order += 8
	when "pizza"
		order += 9
	end
end

puts "your order will be done in #{order} minutes"



# ########### inelegant ugly way  + BONUS ########

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = 0
item = 0
while item != "done" do #i specify a keyword to end the loop
	puts "what do you want? Type 'Done' when done"
	item = gets.chomp.downcase

	case item
	when "soda"
		order += 1.5 #i changed the values here because it's simpler, albeit not necessarily a simulation of real life
	when "fries"
		order += 2.5
	when "milkshake"
		order += 3.5
	when "chicken tenders"
		order += 4.5
	when "hot dog"
		order += 5.5
	when "hamburger"
		order += 6.5
	when "chickeen sandwich"
		order += 7.5
	when "double Cheeseburger"
		order += 8.5
	when "pizza"
		order += 9.5
	end
end

puts "your order will be done in #{(order-0.5)} minutes"


######## 
######## CLASS ANSWER ##########

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

total_completion_time = 0

order = ["Soda", "Pizza", "Hamburger"]
order_index = 0
	# variable must be declared outside the loop because if inside loop it will keep being reassigned
while order_index < order.length do
	item = order[order_index] # "Pizza" = order[1]  ########### investigate more!~~~~~~~
		#OHH he uses this to go 0, 1, 2, looping up because there are 3 items in variable order
		#it doesn't search. its a low-level method.

	item_completion_time = menu.index(item) + 1 # 9 == 8 + 1 == menu.index("Pizza") + 1 
		# array.index(string) gives the index value of "string" in array 

	total_completion_time += item_completion_time #it updates by 
	order_index += 1
end

puts total_completion_time





########### CLASS HASH EXERCISE #########

menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]


order_completion_time = 0
order_qty = 0
while order_qty < order.length
	puts order[order_qty]
	
	item = order[order_qty] #item = order[1] = "Kale Salad"

	order_qty += 1
	order_completion_time = order_completion_time + menu[item] # += menu["Kale Salad"]
end



puts order_completion_time 
























