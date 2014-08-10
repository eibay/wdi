array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
deck = ["Hearts", "Diamonds", "Spades", "Clubs"]
newdeck = []

array.each do |a|
	deck.each do |d|
	newdeck << card = a + d
end
end


cards = [newdeck + newdeck + newdeck + newdeck]

puts cards