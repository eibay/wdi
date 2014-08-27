# make an array of 3=5 comedians
# have them tell their jokes via a loop

require_relative './comedian'

comedians =["Dave Chapelle", "Louis C.K."]

Dave = Comedian.new("Dave Chappelle, my joke goes here #{fav_joke}")
Louis = Comedian.new("Louis C.K., my joke goes here #{fav_joke}")

comedians.each do |x|
	puts x "#{@name} #{fav_joke}"
end

#not sure where on how I was approaching this

################################################################
# solution

comedians = []
mitch = Comedians.new ["Jerry", "Joke goes here"]
jerry = Comedian.new ["Mike", "Joke goes here"]

comedians.push(mitch)
comedians.push(jerry)

comedians.each |x|
	x.tell_joke
end