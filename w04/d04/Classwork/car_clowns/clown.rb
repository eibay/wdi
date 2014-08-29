require_relative './model.rb'
require_relative './car.rb'

class Clown < Model

  def car()
    ### returns the car this clown is in
    return Car.all().find_by(car["clown_id"], @attributes["id"])
  end
end


dozo = Clown.create({"name" => "Dozo", "shoe_size" => "XXL", "car_id" => Car.find_by("color", "Red")["id"]})

