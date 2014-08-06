menu = {"Soda" => 1, 
  	"Chicken Tenders" => 6, 
  	"Fries" => 2, 
  	"Cheeseburger" => 7, 
  	"Deluxe Triple Hamburger and Bacon Combo" => 18, 
  	"Pizza" => 9, 
  	"Kale Salad" => 6}
  
  order = ["Soda", "Kale Salad", "Fries"]

index = 0
total = 0
  while index < order.length
  	
	time = menu[order[index]]
  	index += 1
  	total += time
  	
  end
puts total 