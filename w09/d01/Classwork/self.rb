# How does 'self' in the below example compare to 'this' in Javascript?

class Dog
# this method is owned by the instance
  def bark
    puts "woof"
  end
  
# this method is owned by the class
  def self.species
    puts "I am a Dog!"
  end

end
