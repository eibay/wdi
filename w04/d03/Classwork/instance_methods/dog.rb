class Dog
  #def self.bark #this would allow me to do Dog.bark

  def initialize(name, age, breed) # we give it some info and let it send
      @name = name
      @age = age
      @breed = breed
  end

    def bark
    puts "Woof!"
  end

  def hello
    puts "Hello I am #{@name}, a #{@age} year old and a #{@breed}"
  end
end

# Dog.new creates an instance of the dog class

# fido = Dog.new is an instance of the dog class

# benji = Dog.new is an instance of the dog class as well, a separate one which doesnt affect fido at all

# fido.class comes out to Dog < Object

dog1 = Dog.new("fido", 6, "yorkie")
puts dog1.hello