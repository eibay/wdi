# Goal: To add a new feature to our driverless car application.
# Feature: Our car has an average sized trunk. It can hold up to 6 items, but no more. Write an application that can keep track of what items are currently in the trunk and have it stop me from adding more items once I am up to 6.
# Spec:
# Add items to the trunk
# Be prevented from adding more than 6 items
# Recieve a warning saying "Trunk is full" when attempting to add a 7th item.
# Things to consider:
# How will you represent the trunk in your code?
# Use the below starter code for guidance
# Note that the array of items has more than 6 items, so not all of them should be able to fit in the trunk array.
# Think about how a loop can help you accoplish the spec



trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
counter = 0

while counter < 6
	trunk.push(items[counter])
	counter += 1
end

puts trunk
puts "Trunk is full"

