class Comedian

def initialize(monkey)
  #take a hash and we are setting what the 
  
 @name = monkey["name"]
 @age = monkey["age"]
 @joke = monkey["joke"]
end

def getInfo
  return {"name" => @name,
          "age"=> @age,
          "joke" =>@joke}
end
end