require "pry"

# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(info = {})
		@name = info[:name]
		@age = info[:age]
		@fav_joke = info[:fav_joke]
	end

	attr_reader :name, :age, :fav_joke

	def tell_joke
		puts @fav_joke
	end

	def info
		"Name is #{self.name}, #{self.age} years old, and here's his favorite joke: #{self.fav_joke}"
	end

end


jake = {name: "Jake Johannsen", age: 54, fav_joke: "About aliens."}
nate = {name: "Nate Bargatze", age: 31, fav_joke: "I'm fat."}
joe = {name: "Joe Rogan", age: 47, fav_joke: "People are dumb."}

array = [Comedian.new(jake), Comedian.new(nate), Comedian.new(joe)]

array.each {|comic| puts comic.info}