class Car

  def initialize(year, make, model, color)
      @year = year
      @make = make
      @model = model
      @color = color
  end

  def start_engine
    "Vrum Vrum Vrum!"
  end

  def dads_car
    "First car was a #{@year}, #{@make}, #{@model}, and was #{@color}"
  end

  def another_car
    "Another car is #{@year}, #{@make}, #{@model}, and was #{@color} "
  end
end

dads_miata = Car.new(1992, "Mazda", "Miata", "red")
puts dads_miata.dads_car

travs_first_car = Car.new(1995, "Oldsmobile Cutlass", "Cierra SL", "maroon")
puts travs_first_car.another_car




# instantiate a new car, dads_miata, which is a red Miata and was produced by Mazda in 1992.
# call dads_miata's start_engine method
# instantiate one more car, travs_first_car, which was a maroon 1995 Oldsmobile Cutlass Cierra SL.