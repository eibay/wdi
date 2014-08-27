
class Comedian

  # def initialize(name, age, joke)
  #   @name = name
  #   @age = age
  #   @joke = joke
  # end

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @fav_joke = info[:fav_joke]
  end

  def info()
    return {name: @name, age: @age, fav_joke: @fav_joke}
  end


end
