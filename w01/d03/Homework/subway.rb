n = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l = [nil, nil, "8th", "6th", "Union Square", "3rd", "1st"]
six = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

# origin_line = l
# origin_station = "1st"
# target_line = l
# target_station = "6th"

# if origin_line == target_line
# 	stops = (origin_line.index(origin_station) - target_line.index(target_station)).abs
# else
# 	first_leg = (origin_line.index(origin_station) - origin_line.index("Union Square")).abs
# 	second_leg = (target_line.index("Union Square") - target_line.index(target_station)).abs
# 	stops = first_leg + second_leg
# end
# puts stops

# trip = [six, "Grand Central", n, "23rd"]

# if trip[0] == trip[2]
# 	stops = (trip[0].index(trip[1]) - trip[2].index(trip[3])).abs
# else
# 	first_leg = trip[0].index(trip[1]) - trip[0].index("Union Square")
# 	second_leg = trip[2].index("Union Square") - trip[2].index(trip[3])
# 	stops = first_leg.abs + second_leg.abs
# end

# puts stops

start = {
	line: n,
	station: "Times Square"
}
start[:position] = start[:line].index(start[:station])

target = {
	line: l,
	station: "8th"
}
target[:position] = target[:line].index(target[:station])

if start[:line] == target[:line]
	stops = (start[:position] - target[:position]).abs
else
	stops = ((start[:position] - 4).abs + (target[:position] - 4).abs)
end
puts stops


# Each of the above versions works.










