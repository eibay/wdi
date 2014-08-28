class Taxi

  def initialize(information)
    @name = information["driver_name"]
    @color = information["color"]
    @city = information["city"]
  end

  def info
    return {"driver_name" => @name, "city" => @city, "color"=>@color}
    #this will return a hash
  end

  def infoString
    return @name, @city, @color
end
#this will return a string 
end

info = {"driver_name"=>"Ted", "city"=>"toronto", "color"=>"red"}
driver1 = Taxi.new(info)

puts driver1.info #hash
puts driver1.infoString #string

