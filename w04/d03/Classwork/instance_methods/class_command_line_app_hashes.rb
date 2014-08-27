class Comedian

  def initialize(info)
      @info = info
  end

    def getInfo(name, age, joke)
      { "name" => @name,
      "age" => @age,
      "joke" => @joke }
  end

end