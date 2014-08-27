
class Shirt

	def initialize(size, color, text)
		@size = size
		@color = color
		@text = text
	end

end


class Car

	def initialize(year, make, model, color)
		@year = year
		@make = make
		@model = model
		@color = color
	end


	def start_engine
		return "Vrum vrum vrum!"
	end


end


dads_miata = Car.new(1992, "Mazda", "Miata", "red")

puts dads_miata.start_engine

travs_first_car = Car.new(1995, "Oldsmobile Cutlass", "Cierra SL", "maroon")
