# Declare arrays representing the lines
n_train = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l_train = ["8th", "6th", "Union Square", "3rd", "1st"]
six_train = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

# Need to make arrays the values of a hash. The keys will be the names
# of the individual lines. (Ben)
trains = {
	"N" => n_train,
	"L" => l_train,
	"6" => six_train
}

# These are the stops I'm finding the distance between. I can switch these out.
start_train = "N"
start_stop = "Times Square"
end_train = "6"
end_stop = "Grand Central"

# Need to find the index of the starting stop
start_stop_index = trains[start_train].find_index(start_stop)

# Ditto for the ending stop
end_stop_index = trains[end_train].find_index(end_stop)

# If the stops are on the same train, I can just take the
# absolute value of the difference of the two indexes.
if start_train == end_train
	distance = (start_stop_index - end_stop_index).abs

# Otherwise, I need to transfer at Union Square.
# Find the distance of the starting stop from Union Square
# and add it to the distance of the ending stop from Union Square
else
	# Find Union Square on the starting train line
	start_usq_index = trains[start_train].find_index("Union Square")
	# Find the distance from the starting stop to Union Square
	start_distance = (start_stop_index - start_usq_index).abs

	# Find Union Square on the ending train line
	end_usq_index = trains[end_train].find_index("Union Square")
	# Find the distance from Union Square to the ending stop
	end_distance = (end_stop_index - end_usq_index).abs

	# Add the distances above to get the total number of stops
	distance = start_distance + end_distance
end

puts distance







