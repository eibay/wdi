puts "Let's play blackjack!"

hand_value = 0  

cards = [*2..10, "J", "Q", "K", "A"]
suits = ["♠", "♥", "♦", "♣"]
deck = []
hand = []

suits.each { |suit|
cards.each {|card|
deck.push(suit.to_s + card.to_s)
}
}

deck = deck.shuffle



values = { 
"♠2" => 2,
"♠3" => 3,
"♠4" => 4, 
"♠5" => 5,
"♠6" => 6, 
"♠7" => 7, 
"♠8" => 8, 
"♠9" => 9, 
"♠10" => 10, 
"♠J" => 10, 
"♠Q" => 10, 
"♠K" => 10, 
"♠A" => 1, 
"♥2" => 2, 
"♥3" => 3, 
"♥4" => 4, 
"♥5" => 5, 
"♥6" => 6, 
"♥7" => 7, 
"♥8" =>8, 
"♥9" => 9, 
"♥10" => 10, 
"♥J" => 10, 
"♥Q" => 10, 
"♥K" => 10, 
"♥A" => 1, 
"♦2" => 2, 
"♦3" => 3, 
"♦4" => 4, 
"♦5" => 5, 
"♦6" => 6, 
"♦7" => 7, 
"♦8" => 8, 
"♦9" => 9, 
"♦10" => 10, 
"♦J" => 10, 
"♦Q" => 10, 
"♦K" => 10, 
"♦A" => 1, 
"♣2" =>2, 
"♣3" => 3, 
"♣4" => 4, 
"♣5" => 5, 
"♣6" => 6, 
"♣7" => 7, 
"♣8" => 8, 
"♣9" => 9, 
"♣10" => 10, 
"♣J" => 10, 
"♣Q" => 10, 
"♣K" => 10, 
"♣A" => 1
 }

def calc_hand(a, b, c=0, d=0, e=0)
	a + b + c + d + e
end
def delete_0(x)
	x.delete_at(0)
	x.delete_at(0)
	x.delete_at(0)
end 

while 2 < deck.length 
	3.times {hand.push deck.delete_at(0)}
	puts "your hand is " 
	puts hand

	hand_1 = calc_hand(values[hand[0]], values[hand[1]], values[hand[2]])
	puts hand_1
	if hand_1 == 21
		puts "Yay! You won!"
	elsif hand_1 >21
		puts "BUST!"
	else
		puts "you are " 
		puts 21 - hand_1.to_i
		puts " away from 21."
	end 
	delete_0(hand)
	puts hand

end 
