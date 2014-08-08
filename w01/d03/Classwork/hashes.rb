# zoo = {}

# zoo["Pico"]= "bird"
# zoo["Sunflower"] = "cat"
# zoo["Maximus"] = "cat"
# zoo["Ramsey"] = "dog"
# zoo["Speedy"] = "turtle"
 


# menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}

# order = ["Soda", "Kale Salad", "Fries", "Cheeseburger", "Fries"]

# order_index = 0

# total_time = 0

# while order_index < order.length

# 	total_time += menu[order[order_index]]
# 	order_index += 1

# end

# puts total_time


  users = {
      jeff: {
        github: "jkonowitch",
        favorite_numbers: [12, 42, 75, 8, 50]
      },
      neel: {
        github: "darthneel",
        favorite_numbers: [11, 99, 24]
      },
      sean: {
        github: "sean-west",
        favorite_numbers: [17, 13, 21]
      }
    }


 i = 0

 while users[:jeff][:favorite_numbers][i] % 2 == 0 && i < (users[:jeff][:favorite_numbers].length)
 	
  puts users[:jeff][:favorite_numbers][i]
  i += 1
 
 end

  













