require_relative('./comedian')
require'pry'


comedians =[]

mitch = Comedian.new("Mitch", "22", "Q: What did the femur say to the patella? A: I kneed you")
comedians.push(mitch)

bob = Comedian.new("Bob", "27", "Q: What do you call a computer that sings? A: A-Dell")
comedians.push(bob)

justin= Comedian.new("Justin", "32", "Q: How do you make a tissue dance? A: Put a little boogey in it!")
comedians.push(justin)


comedians.each do |comedian|
	puts comedian.string_output
end