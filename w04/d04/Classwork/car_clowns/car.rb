require_relative './model'
#< inheritance
#like requiring
#all of this behavior and methods and now are mine
class Car < Model
end

def clown
  Clown.select_by("car_id", @attributes["id"])
end
#attribute is the car