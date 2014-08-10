array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
deck = ["Hearts", "Diamonds", "Spades", "Clubs"]
newdeck = []

array.each do |a|
	deck.each do |d|
	newdeck << card = a + " " + d
end
end


cards = [newdeck, newdeck, newdeck, newdeck]


counter5 = rand(3)

card100 = cards[rand][rand(cards[counter5].length)]
card200 = cards[rand][rand(cards[counter5].length)]

card1 = card100.split(" ")
card2 = card200.split(" ")

if card1.include?"A"
	card3 = 1
elsif card1.include?"J" 
	card3.include? 10
elsif card1.include?"Q"
	card3 = 10
elsif card1.include?"K"
	card3 = 10
else
	card3 = card1[0].to_i
end

if card2.include?"A"
	card4 = 1
elsif card2.include?"J" 
	card4 = 10
elsif card2.include?"Q"
	card4 = 10
elsif card2.include?"K"
	card4 = 10
else
	card4 = card2[0].to_i
end

total = card3 + card4
puts "Your total is #{total}, and your cards are #{card100} and #{card200}"

	

