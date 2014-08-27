require_relative './lib/comedian'

comedians = []

comedians << com1 = Comedian.new("sean", 30, "Hi...")
comedians << com2 = Comedian.new("neal", 30, "Yo...")
comedians << com3 = Comedian.new("jeff", 30, "Oh...")

comedians.each do |comedian|
	puts comedian.tell_joke
end



