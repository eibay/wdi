require_relative './model.rb'
require_relative './clown.rb'

class Car < Model


  def clowns()
    ### return all the clowns in this car
    return Clown.select_by("car_id", @attributes["id"])

  end



end

