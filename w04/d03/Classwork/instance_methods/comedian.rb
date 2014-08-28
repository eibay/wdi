class Comedian

  def initialize(name, age, fav_joke)
    @name = name
    @age = age
    @fav_joke = fav_joke
  end

# returns me a new instance of comedian and sends it to ya_mama
  def joke
   puts "My name is #{@name}, I am #{@age} and I have to say that #{@fav_joke}"
end
end

ya_mama = Comedian.new("Johnny Bananas", 25, "yo mama so fat that she dont need the internet she's already world wide")
puts ya_mama.joke