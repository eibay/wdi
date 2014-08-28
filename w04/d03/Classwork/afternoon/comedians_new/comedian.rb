class Comedian #notes

	#comedians = []

	#Comedian.new = (name, age, joke)

	def initialize(name, age, joke)
		@name = name
		@age = age
		@joke = joke
	end

	def name
		return @name
	end
   
    def get_the_name
    	return @name 
    end

    def getInfo
    	return {"name" => @name, "age" => @age, "joke" => @joke}
    end

end

mitch = Comedian.new()
puts mitch.getInfo["age"]

info = {"name" => "sean", "age" => 28}

def initialize( attributes )