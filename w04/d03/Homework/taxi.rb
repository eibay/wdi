class Taxi
  def initialize(driver_hash)
    @name = driver_hash[:name]
    @city = driver_hash[:city]
    @color = driver_hash[:color]
  end

  def info
    return "Driver: #{@name}, City: #{@city}, Color: #{@color}"
  end

end
