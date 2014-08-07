menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# want to say, if I have an order what is total time for , e.g., order = ["Soda", "Pizza", "Hamburger"]

# biggest tool is while loop. Key is direct value between index value and time to complete, perfectly correlated.
order = ["Soda", "Pizza", "Hamburger"]

total_completion_time = 0  #because you want the value of the variable to persist, you define it outside the loop


# this index is used to loop through the order array
order_index = 0        #declare variable outside the loop, NOT INSIDE. you want the loop to restart without resetting the initial variable; when you want the loop, not the definition to control value


while order_index < order.length   #when to stop, loop not thru menu, but thru order ; .length will always be one higher than last index number, counting the elements

        #big question  we're working on is about the time to complete each
        item_completion_time = menu.index(order_index)  #know value from position of soda index in menu; use method .index; need parameter () to evaluate to order array
              #go to order array and check VALUE OF INDEX (which we've initially defined as 0); first will get value of Soda, then Pizza, then Hamburger
        puts total_completion_time
        order_index += 1  #this makes the iteration move thru the target array

end

puts total_completion_time


# # This is a mess. At various points earlier on, I seemed more on the right path, but I definitely lost it and seem only to be getting more lost.
# # I expect to get clear when we review homework, but otherwise, I'll go over it with the TA tomorrow.


# #PRELIMINARIES

# item_i = 0	#counter set to 0

# desire = "Yes"

# menu_option_array = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# order_array = []					#creates array to hold selected_items


# #PROCEDURES

# while (item_i <=7) 
#   puts "Do you want to order food? Yes or No"
#   desire = gets.chomp
#   if desire == "Yes"
#   	puts "What will you have?"
#   	food = gets.chomp
# #	puts food
#                             #on review: need totalcooktime = menu_option_array.index()


# order_array << food   
# puts order_array            # On review: I needed to use this in the anything else section too! That's why it wasn't including the extra items.

# 	puts "Anything else?"
# 	more = gets.chomp
#   item_i = item_i + 1
# end
# end

#                             # On review: had the above worked, would need procedure to add the cooktime
#                             #could be totalcooktime=menuarrayname.index(selecteditemfromuser)

# # order_array.push(4).push(5)


# # order_array << "world"   

# #--ITERATION

# # while (item_i <=7) 					# for elements 0-7
# # 	puts "would you like to order something?"
# # 	response = gets.chomp
# # 		if response == "yes"
# # 			what_u_want
# # 			item_i = item_i +1	
# # 			order_array.push(food)  	#pushes (adds) selected_item to order_array
# # 		end
# # end
# 	puts order_array[]

# # #--METHODS

# # def want_to_order
# # 	puts "would you like to order something?"
# # 	response = gets.chomp
# # end

# # def what_u_want
# # 	puts "what would you like?"
# # 	food = gets.chomp
# # end

# # def anything_more
# # 	puts "would you like anything else?"
# # 	more_yes_no = gets.chomp
# # end

# # def what_more
# # 	puts "what else would you like?"
# # 	food = gets.chomp
# # end
