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
