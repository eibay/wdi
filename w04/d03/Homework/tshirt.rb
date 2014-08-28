class Shirt

	def initialize(size, color, text)
		@size = size
		@color = color
		@text = text
	end

	def string
		return "Size: #{@size}, Color: #{@color}, Text: #{@text}"
	end	
end

pearl_jam_t = Shirt.new("extra-large", "faded black", "Yield Tour 1998")
puts pearl_jam_t.string

hipster_plaid = Shirt.mew("medium", "red", "NO LOGO")
puts hipster_plaid.string