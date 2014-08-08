n = [nil, "Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l = [nil, "8th", "6th", "Union Square", "3rd", "1st"]
six = [nil, "Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
q = [nil, "Times Square", "Herald Square", "Union Square", "Canal St."]

lines = {
	n: n,
	l: l,
	:"6" => six,
	q: q
}

def get_line(hash)
	line = nil
	puts "You may enter N, L, 6 or Q."
	while line == nil
		line = hash[gets.chomp.downcase.to_sym]
		puts "That was not a valid entry.  You may enter N, L, 6 or Q." if line == nil
	end
	line
end

def get_position(line)
	index = 1
	position = nil
	puts "I will list the stations on that line from which you may choose."
	puts "Please enter the number of your choice."
	while position == nil
		while index < line.length
			puts index.to_s + " #{line[index]}"
			index += 1
		end
		position = gets.chomp.to_i
		unless (1..(line.length - 1)).include?(position)
			puts "Invalid entry. Enter the number of your selection."
			position = nil
			index = 1
		end
	end
	position
end

puts "On what line would you like to begin your trip?"
origin_line = get_line(lines)
origin_position = get_position(origin_line)

puts "And, on what line is your destination?"
target_line = get_line(lines)
target_position = get_position(target_line)

if origin_line == target_line
	stops = (origin_position - target_position).abs
else
	first_leg = origin_position - origin_line.index("Union Square")
	second_leg = target_line.index("Union Square") - target_position
	stops = first_leg.abs + second_leg.abs
end

puts "Your trip will require #{stops} stops.  Enjoy riding the subway! (snickers into collar)"

