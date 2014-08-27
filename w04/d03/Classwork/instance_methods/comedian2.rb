require_relative './comedian_class'

comedians = []

loop do
	
jeff = Comedian.new("Jeff", 25, "Yo mama joke")
jesse = Comedian.new("Jesse", 30, "Seinfeld joke")
marc = Comedian.new("Marc", 28, "Joke")

comedians << jeff
comedians << jesse
comedians << marc


comedians.each do|x|
	puts x.getInfo
end
end