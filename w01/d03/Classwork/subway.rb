N =  ["Times Sq", "34th", "28th", "23rd", "Union Sq", "8th"]
L = ["8th", "6th", "Union Sq", "3rd", "1st"]
six = ["Grand Central", '33rd', "28th", "23rd", "Union Sq", "Astor Place"]

line_start = L
start_stop = L[1]

line_end = six
end_stop = L[-1]


index = 0

def find_union(line_start)
	index = 0
while index < line_start.length
	#puts index
	puts "#{line_start[index]}"
	#if line_start[index] == "Union Sq"
	to_Union = line_start.index("Union Sq")
	index += 1
end
puts to_Union
end


find_union(L)