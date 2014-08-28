class Taxi
  def initialize(driver_name, city, colour)
    @driver_name = driver_name
    @city = city
    @colour = colour
  end

  def describe
    return "This taxi is #{@colour}, is from #{@city}, and is driven by #{@driver_name}"
  end

end