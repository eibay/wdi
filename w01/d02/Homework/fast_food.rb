menu = {
	"Soda" => 1,
	"Fries" => 2,
	"Milkshake" => 3,
	"Chicken Tenders" => 4,
	"Hot Dog" => 5,
	"Hamburger" => 6,
	"Chicken Sandwhich" => 7,
	"Double Cheeseburger" => 8,
	"Pizza" => 9,
}

	time = menu.inject(0) { |x,y| x += y[1] }

	puts "It will take about #{time} minutes to cook everything on the menu"



