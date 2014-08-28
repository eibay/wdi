# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(name, age, fav_joke) 
    #info = {"name"=>"sean", "age"=>30}
    #can do def initalize(attributes)
    #sean = Comedian.new(info)
    #same variables
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def tell_joke #should be tellJoke
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

#can also do 
def getInfo #firstwork lowercase seonc capital 
  return {"name" => @name, "age" =>@age, "joke" => @fav_joke}
end
#gets a method that returns a hash
#mitch = Comedian.new("mitch", 34, "knock")
#puts mitch.getInfo["age"]<--acts as a hash

end




