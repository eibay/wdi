class Shirt
	def initialize(size, color, text)
		@size = size
		@color = color
		@text = text
	end

	def display_info
		return "#{@size} \n #{@color} \n #{@text}" 
	end 



end


pearl_jam = Shirt.new("XL", "black", "yield tour 1998")
hipster_plaid = Shirt.new("M", "red", "NO LOGO")
soccer_t = Shirt.new("S", "black/white", "CHS Soccer League")
white_t = Shirt.new("XL", "white", "yup in my white_t")

tees=Array.new
tees.push(pearl_jam, hipster_plaid, soccer_t, white_t)

tees.each do |a|
	puts a.display_info
end

