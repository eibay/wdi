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
	a.to_i + b.to_i + c.to_i + d.to_i + e.to_i
end
def clear_hand(x)
	x.clear
end 

while 2 < deck.length 
	2.times {hand.push deck.shift}
	puts "your hand is " 
	puts hand

	hand_1 = calc_hand(values[hand[0]], values[hand[1]]) #values[hand[2]], values[hand[3]], values[hand[4]])
	
	puts hand_1
	
	while hand_1 < 21 
		puts "Do you want to hit or stay"
		
		hit_or_stay = gets.chomp
		
		if hit_or_stay == "hit"
			puts hand.push(deck[0])
			deck.shift
			puts hand_1 +=  values[hand[2]]
			
		else
			puts "ok you are staying at " 
			puts hand_1
			break 
		end
	end

	if hand_1 == 21
		puts "Yay! You won!"
	elsif hand_1 > 21
		puts "BUST!"
	else 
		puts "Good round! Let's play again"
	end 
	clear_hand(hand)
	puts hand
end
 
puts "Out of cards! Good game"
