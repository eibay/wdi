require_relative './model'

class Clown < Model
end

def car
  Car.find_by("id", @attribute["car_id"])
end
#attribute is the clown