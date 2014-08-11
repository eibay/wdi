#blackjack1


suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Ace", "King", "Queen"]

suits.each do |suit|

	cards.size.times do |i|

	puts "#{cards[i]} of #{suit}"

  end

end
