###Part 4

# - Goal: Create one sided blackjack
#   - A user is given two cards at random
#   - They can type "Hit me" or "Stay"
#   - If they type "Hit me" then draw another card, if they have gone bust tell them. Then draw another hand, which will once again give them the options "Hit Me" or "Stay".
#   - If they choose "Stay" then output the Blackjack value of their hand. Then draw another hand, , which will once again give them the options "Hit Me" or "Stay".
# - The game should end when you run out of cards

# require 'socket'

# server = TCPServer.new 1000
# client = server.accept

marks = ["♠", "♥", "♦", "♣"]
numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
$deck = []
$hands = []
$values = []

$value = 0
$value_total = 0

numbers.each { |number|
marks.each { |mark|
	card = number + mark
	$deck.push(card)
}


def pick_card(n)
	if $deck.length > 2	
		n.times {
			random_card = $deck.sample
			$hands << random_card
			$deck.delete(random_card)
		}

		puts "Your cards are #{$hands}"

		$hands.each { |hand|
			case hand.chr
			when "A"
				$value += 1
			when "2"
				$value += 2
			when "3"
				$value += 3
			when "4"
				$value += 4
			when "5"
				$value += 5
			when "6"
				$value += 6
			when "7"
				$value += 7
			when "8"
				$value += 8
			when "9"
				$value += 9
			else
				$value += 10
			end
		}

		$value_total += $value
		$hands.clear

			if $value_total < 22
				puts "Your value is #{$value_total}"
				$value = 0
				puts "Do you want 'Hit Me' or 'Stay'"
				user_answer = gets.chomp.downcase

				if user_answer == "hit me"
					pick_card(1)
				else
					puts "Your value is #{$value_total}"
					$value = 0
			    end
			else
				puts "Bust!"
				$hands.clear
				$value = 0
				$value_total = 0

				if $deck.length < 3
					puts "We are out of cards"
				else	
					puts "Do you want 'Hit Me' or 'Stay'"
					user_answer = gets.chomp.downcase

					if user_answer == "hit me"
						pick_card(2)
					else
						puts "Your value is #{$value_total}"
						$value = 0
					end	
				end
			end	
	else
		puts "We are out of cards"
	end
end

pick_card(2)







