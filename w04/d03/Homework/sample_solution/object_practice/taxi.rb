class Taxi
  def initialize(driver_name, city, color)
    @driver = driver_name #different names! I can call them whatever I please
    @city = city
    @color = color
  end

  def printAttributes
    puts "My driver is " + @driver
    puts "I have a " + @color + " taxi"
    puts "And I drive in the city of " + @city
  end
end
