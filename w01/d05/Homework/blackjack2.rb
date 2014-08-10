array = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

cards = [array, array, array, array]

counter5 = rand(3)

card1 = cards[rand][rand(cards[counter5].length)]
card2 = cards[rand][rand(cards[counter5].length)]

if card1 == "A"
	card3 = 1
elsif card1 == "J" 
	card3 = 10
elsif card1 == "Q"
	card3 = 10
elsif card1 == "K"
	card3 = 10
else
	card3 = card1.to_i
end

if card2 == "A"
	card4 = 1
elsif card2 == "J" 
	card4 = 10
elsif card2 == "Q"
	card4 = 10
elsif card2 == "K"
	card4 = 10
else
	card4 = card2.to_i
end

total = card3 + card4
puts "Your total is #{total}, and your cards are #{card1} and #{card2}"

	

