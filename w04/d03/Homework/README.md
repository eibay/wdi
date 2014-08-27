### Review

Everything in ruby is an instance of an object of some sort.
Objects have behavior (methods) and data (instance variables).

```ruby
# Instantiating an Array in 'literal' form
students = []

# Instantiating an array with the `new` form 
students = Array.new()
```

If you think about a hash, for example, it holds specific data - keys & values - and allows you to operate on that data using methods.

```ruby
me = { name: "Jeff", location: "NYC" }

me.keys
#=> [:name, :location]

me[:name]
#=> "Jeff"
```

**Significance of the word `instance`**

Each instance of a class has the same behavior but *different* data. Just like every book has similar behavior - you can open it, read it, put it on a shelf - but each one has totally different "data" - ie the words on the pages, the author.

Similarly, every string is fundamentally the same in terms of **how** it works, but each hash we make contains totally different data.

```ruby
jeff = "Jeff" # <-- instance of the String class with data Jeff
sean = "Sean" # <-- instance of the String class with data Sean

jeff.downcase
sean.downcase
```

**Things to keep in mind**

1) Because everything in ruby is an instance of a class, it is important to understand these concepts.

2) Understanding how to write classes with instances methods allows us to define **our own kinds of objects**. Instead of Arrays, Hashes, Strings...we can design our own objects for our own purposes.

3) BUT, we aren't yet at a point where we quite understand why or when we would want to create our own objects. That isn't the point of learning this right now.

4) A very important library we will start to use next week makes use of custom objects. We only need to understand the basic mechanics of object construction in order to use the library.

5) SO, don't sweat it if you don't fully understand the implications of objects. In fact, you really shouldn't at this point. The only important part of this are the *mechanics* of creating and instantiating new objects. That is what the hw practices.

```ruby
class Dog
  def initialize(name, breed)
    @name = name # <---- data
    @breed = breed # <--- data
  end

  def name # <--- behavior
    return @name
  end

  def breed # <--- behavior
    return @breed
  end

  def bark # <--- behavior
    return "Hello, human - my name is #{@name}"
  end
end

fido = Dog.new("Fido", "yorkie")
fido.bark
#=> "Hello, human - my name is Fido"

chloe = Dog.new("Chloe", "Havanese")
chloe.bark
#=> "Hello, human - my name is Chloe"
```

**Problem we will solve tomorrow**

We will create our own objects for Students and Dorms. It will allow us to define specific methods on these objects so we can go from code like this:
  ```ruby
    student = Student.find_by("name", "Jeff")
    dorm = Dorm.find_by("id", student["id"])
  ```
To this:
  ```ruby
    student = Student.find_by("name", "Jeff")
    dorm = student.dorm
  ```