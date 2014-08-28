require_relative './model'

class Clown < Model

  def car
  # and then a method on clown called car which returns the car this clown is in
    return Car.find_by("id", @attributes["car_id"])
  end
end

# create two new clowns then find the car for the clown and make sure u call car.clown to see these clowns in the cars.

