n = ["Times Square", "34th Street", "W. 28th Street", "W. 23rd Street", "Union Square", "8th Street"]
six = ["Grand Central", "33rd Street", "E. 28th Street", "E. 23rd Street", "Union Square", "Astor Place"]
l = ["8th Avenue", "6th Avenue", "Union Square", "3rd Avenue", "1st Avenue"]

starting_line = n
starting_stop = "Times Square"

ending_line = six
ending_stop = "E. 28th Street"

if starting_line == ending_line

stops_total = ending_line.index(ending_stop) - starting_line.index(starting_stop)

puts stops_total

else

first_leg = starting_line.index("Union Square") - starting_line.index(starting_stop)
second_leg = ending_line.index(ending_stop) - ending_line.index("Union Square")

puts first_leg + second_leg.abs

end