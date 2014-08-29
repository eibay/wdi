require_relative './lib/comedian'

# comedians = []

# comedians << com1 = Comedian.new("sean", 30, "Hi...")
# comedians << com2 = Comedian.new("neal", 30, "Yo...")
# comedians << com3 = Comedian.new("jeff", 30, "Oh...")

com1 = Comedian.new("sean", 30, "Hi...")
com2 = Comedian.new("neal", 30, "Yo...")
com3 = Comedian.new("jeff", 30, "Oh...")

comedians = [com1, com2, com3]

comedians.each do |comedian|
	comedian.tell_joke
end



