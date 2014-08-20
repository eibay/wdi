class Card

	attr_accessor :suit, :rank, :value

	SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]
	RANKS = [nil, "Ace", "2", "3", "4", "5", "6", "7", "8", "9",
				"10", "Jack", "Queen", "King"]

	def initialize(rank, suit)
		@suit = SUITS[suit]
		@rank = RANKS[rank]
		@value = [10, rank].min
	end

	def to_s
		"#{rank} of #{suit}"
	end

end