# harry.potter@hogwarts.edu
# hermione.granger@hogwarts.edu
# ronald.weasley@hogwarts.edu
# arthur_weasley@ministryofmagic.gov.uk
# garrick@olivanderswands.co.uk

# Sam Lion
# Tom Elephant
# John Giraffe
# Frank Lion
# Joe Elephant


  menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
  order = ["Soda", "Kale Salad", "Fries"]

total_completion_time = 0

order.index = 0

while order_index < order.length

	item = order[order_index]
	item_completion_time = menu[item]
	total_completion_time += item_completion_time
	
puts total completion time

order_index += 1

end