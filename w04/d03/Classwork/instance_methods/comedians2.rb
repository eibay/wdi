class Comedian


def initalize("name"=>name, "age"=>age, "joke"=>joke)
  name = @name
  age = @age
  joke = @joke
end

def getInfo
  return {"name" => @name,
          "age"=> @age,
          "joke" =>@joke}
  end
  end