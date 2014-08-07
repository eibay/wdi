menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

#Direct relationship between index value and food completion time.
#The correlation between time and index value was the main focus.
#The only way to loop through an array is through index values
#Start by looping through ur order because that is more important
#We declare the index outside of the loop because any variables inside the loop keep getting reset
#every single time when it loops.
#

#This index is used to loop through the order array

order_index = 0
total_completion_time = 0


while order_index < order.length #while 0 is less than soda, pizza, hamburger
 item = order[order_index] #use item variable to update soda, pizza, hamburger by their index
  item_completion_time = menu.index(item) + 1 #give me whats at the 0 index #searches through the menu to match with order
   total_completion_time += item_completion_time #0 is updated through each iteration with the time it takes to make the order
  puts total_completion_time #Outputs time when loop goes through each item completion
 order_index += 1 # updated each time.
end

puts total_completion_time


