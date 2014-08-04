#get straight on iterator/loop/array


location = "New York"
#need to compare input and your valid locations
if (location == "New York") || (location == "San Francisco") || (location == "Dallas")
=begin [this is a misleading line; looks like saying if location is one of these, good. not saying that. 
it stops with the first true match, i.e., New York; not evaluating all. fixed if you add the "location =="
to each element that is evaluated]
=end
  puts "Yes, we go there"
else
	puts "try again"
end

# could also use sequence of ifs and elsifs, though that would collapse with more complicated logic