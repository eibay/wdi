trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

space = 0

 while space < 7
   item = items.shuffle.sample
    trunk << item
 if space < 6
   puts "You added #{item} to your trunk"
    items.delete(item)
 else
   puts "trunk is full"
  end
 space += 1
end