# harry.potter@hogwarts.edu
# hermione.granger@hogwarts.edu
# ronald.weasley@hogwarts.edu
# arthur_weasley@ministryofmagic.gov.uk
# garrick@olivanderswands.co.uk



#Redoing bonus question from yesterday to use hashes instead
#values are minutes
#Big change is now the meny we actually know how long is takes to make each one
# the value are minutes

# menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, 
# 	    "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
#   order = ["Soda", "Kale Salad", "Fries"]


# total_completion_time = 0
# order_index = 0


# while order_index < order.length  
#  item = order[order_index] 
#   item_completion_time = menu[item] 
#    total_completion_time += item_completion_time 
#   puts total_completion_time 
#  order_index += 1 
# end

# puts total_completion_time

# zoo = {
# 		"Yogi" => "Bear",
# 		"Booboo" => "Tiny bear",
# 		"Tony the" => "Tiger",
# 		"Moby dick" => "Whale",
# 		"Random name" => "Random Animal"
# }


#Let's keep track of animals by Species this time
#zoo = {}
#Add an array to the zoo for each species which are the keys then fill the arrays with the animals name.
#which are the values
#The key should be the species, and the value is an array
#Practce recalling each animals name, bascially get the value, by doing for example
#zoo[:Fish][1]
#Gives "Tuna"

zoo =                                                              
{
    :Fish => [
         "Nemo",
         "Tuna",
         "Sharknadoooooo"
    ],
    :Bird => [
         "Woodpecker",
         "Pigeon",
         "Birrrrrrrrddddddmaaaaaaan"
    ]
}

puts zoo







