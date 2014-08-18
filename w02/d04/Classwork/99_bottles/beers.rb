bottles = [1..99]
i=0

while i<0
	puts bottles[i]
	i-=1
end



bottles.each {|99| print x, " -- " }

names = ["Sean", "Jeff", "Neel"]

newnames = []

names.each do |n| #each is not about returning stuff. There has to be an action, it's about doing stuff.
	newnames << n.upcase
end