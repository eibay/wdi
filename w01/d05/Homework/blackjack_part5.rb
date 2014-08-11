require 'socket'

server = TCPServer.new 9991
client = server.accept

marks = ["♠", "♥", "♦", "♣"]
		numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
		$deck = []
		$player_hands = []
		$dealer_hands = []
		$values = []
		$player_value = 0
		$dealer_value = 0
		$player_total = 0
		$dealer_total = 0

		numbers.each { |number|
		marks.each { |mark|
			card = number + mark
			$deck.push(card)
			}
		}

	def first_deal(n)
		n.times {
			random_card = $deck.sample
			$player_hands << random_card
			$deck.delete(random_card)
		}

		$player_hands.each { |hand|
			case hand.chr
			when "A"
				$player_value += 1
			when "2"
				$player_value += 2
			when "3"
				$player_value += 3
			when "4"
				$player_value += 4
			when "5"
				$player_value += 5
			when "6"
				$player_value += 6
			when "7"
				$player_value += 7
			when "8"
				$player_value += 8
			when "9"
				$player_value += 9
			else
				$player_value += 10
			end
		}

		n.times {
			random_card = $deck.sample
			$dealer_hands << random_card
			$deck.delete(random_card)
		}

		$dealer_hands.each { |hand|
			case hand.chr
			when "A"
				$dealer_value += 1
			when "2"
				$dealer_value += 2
			when "3"
				$dealer_value += 3
			when "4"
				$dealer_value += 4
			when "5"
				$dealer_value += 5
			when "6"
				$dealer_value += 6
			when "7"
				$dealer_value += 7
			when "8"
				$dealer_value += 8
			when "9"
				$dealer_value += 9
			else
				$dealer_value += 10
			end
		}

		$player_total += $player_value
		$dealer_total += $dealer_value
		$player_value = 0
		$dealer_value = 0
end

def player_deal(user_hands, user_total)
	user_value = 0
	random_card = $deck.sample
	user_hands << random_card
	$deck.delete(random_card)

	case random_card.chr
	when "A"
		user_value += 1
	when "2"
		user_value += 2
	when "3"
		user_value += 3
	when "4"
		user_value += 4
	when "5"
		user_value += 5
	when "6"
		user_value += 6
	when "7"
		user_value += 7
	when "8"
		user_value += 8
	when "9"
		user_value += 9
	else
		$user_value += 10
	end

	user_total = user_total + user_value
	user_value = 0
end		

first_deal(2)

client.puts "Your choice are #{$player_hands}"

client.puts "Your value is #{$player_total}"
$player_value = 0

client.puts "Do you want 'Hit Me' or 'Stay'"
user_answer = client.gets.chomp.downcase

if user_answer == "hit me"
	player_deal($player_hands, $player_total)
	client.puts "Your choice are #{$player_hands}"

	if $player_total < 22
	client.puts "Your value is #{$player_total}"
	else
	puts "Bust!"
	puts "Computer won"
	end

	if $dealer_total < 22
	# client.puts "Computer value is #{$dealer_total}"
	$dealer_value = 0
	else
	puts "Bust!"
	puts "You won"

	end
	else
		client.puts "Your value is #{$value_total}"
		$value = 0
end	

if $player_value > $dealer_value
	client.puts "You won!"
else
	client.puts "You lose"
	client.close
end








