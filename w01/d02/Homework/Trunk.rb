# Not sure if I did this exercise correctly, but I had simplified 
# it as much as much as possible. I asked the user how many items
# they wanted to put into the trunk with a limit of 6 and anything 
# below 6 would illict a "plenty of room" response and vice versa above
# 6 would trigger "trunk is full" response.

trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", 
"Jumper Cables", "Ice Scraper"]
trunk = 0

puts "How many things would you like to put in your trunk?"
items = gets.chomp.to_i

while trunk != items 
   puts trunk
   trunk += 1
   if trunk == 6 
   	   	puts "The trunk is full!!"
   else trunk <= 6
   		puts "There's plenty of room!"
end
end

