class Comedian
	def initialize(attributes)
		@name = attributes[:name]
		@age = attributes[:age]
		@joke = attributes[:joke]
	end

	# def getInfo
	# 	return {name: @name, age: @age, joke: @joke}
	# end

	def say 
		puts "#{@name}, age #{@age}, says '#{@joke}'"
	end
end

comedians = [mitch = Comedian.new({name: "Mitch", age: 37, joke: "I used to do drugs. I still do, but I used to, too."}),
			richard = Comedian.new({name: "Richard", age: 50, joke: "I had to stop drinking, cause I got tired of waking up in my car driving 90."}),
			tommy = Comedian.new({name: "Tommy", age: 40, joke: "I’m on a whiskey diet…I’ve lost three days already."})]

# comedians.each {|comedian| puts "#{comedian.getInfo[:name]}, age #{comedian.getInfo[:age]}, says '#{comedian.getInfo[:joke]}'"}

comedians.each {|comedian| comedian.say }