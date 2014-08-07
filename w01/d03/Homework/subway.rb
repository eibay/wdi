n = ["Times Square", "34th Street", "W. 28th Street", "W. 23rd Street", "Union Square", "8th Street"],
six = ["Grand Central", "33rd Street", "E. 28th Street", "E. 23rd Street", "Union Square", "Astor Place"],
l = ["8th Avenue", "6th Avenue", "Union Square", "3rd Avenue", "1st Avenue"]

starting_line = l
starting_stop = "6th Avenue"

ending_line = l
ending_stop = "3rd Avenue"

stops_total = l.index(ending_stop) - l.index(starting_stop)

puts stops_total.abs

# subway = {

# 	:n => {
# 		"Times Square" => 1, 
# 		"34th Street" => 2, 
# 		"W. 28th Street" => 3, 
# 		"W. 23rd Street" => 4, 
# 		"Union Square" => 5, 
# 		"8th Street" => 6 
# 		},

# 	:six => {
# 		"Grand Central" => 1, 
# 		"33rd Street" => 2, 
# 		"E. 28th Street" => 3, 
# 		"E. 23rd Street" => 4, 
# 		"Union Square" => 5, 
# 		"Astor Place" => 6
# 		},

# 	:l => {
# 		"8th Avenue" => 1, 
# 		"6th Avenue" => 2, 
# 		"Union Square" => 3, 
# 		"3rd Avenue" => 4, 
# 		"1st Avenue" => 5
# },
# }

# starting_line = subway[:l]
# starting_stop = subway[:l]["6th Avenue"]

# ending_line = subway[:l]
# ending_stop = subway[:l]["3rd Avenue"]

# stops_total = ending_stop - starting_stop

# puts stops_total