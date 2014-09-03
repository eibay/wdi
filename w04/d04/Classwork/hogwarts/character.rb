require_relative './model'

class Character < Model

  def house
    Character.find_by("id", "house_id")
  end

end
