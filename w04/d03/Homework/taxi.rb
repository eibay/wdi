# Create a Taxi class with the attributes - driver_name, city, color
# Add a method that returns all of the attributes to the terminal as a string

class Taxi

  def initialize(driver_name, city, color)
    @driver_name = driver_name
    @city = city
    @color = color
  end

  def cabbie
    puts "Hellooooooooo, my name is #{@driver_name}, how do you like #{@city} so far? I agree everything is really #{@color} here!"
    puts "Enjoy your stay!"
  end
end

  uber = Taxi.new("Ranjit", "New York", "colorful")
  puts uber.cabbie



