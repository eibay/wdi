# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def tell_joke
		return @fav_joke
    #sends it to be output
    #when you use puts it wont string interpolate
    #always use return 
  end

  def name
    return @name
  end

  def age
    return @age
  end

end