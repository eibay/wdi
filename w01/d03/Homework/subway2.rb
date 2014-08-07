mta = {
	N: ["Times Sq", "34th", "28th", "23rd", "Union Sq", "8th"],
	L: ["8th", "6th", "Union Sq", "3rd", "1st"],
	Six: ["Grand Central", '33', "28", "23", "Union Sq", "Astor Place"]
}

line_start = :N
start_stop = mta[:N][1]

line_end = :Six
end_stop = mta[:Six][-1]
puts "NYC Subway Stop Counter"
puts "-----------------------"
puts "Train Lines"
print "N: #{mta[:N]}"
puts
print "L: #{mta[:L]}"
puts
print "Six: #{mta[:Six]}"

puts
puts
puts "What line are you on? N, L or Six?"
line_start = gets.chomp.to_sym
puts "What stop on that line are you on?"
start_stop = gets.chomp

puts "Where would you like to go?"
end_stop = gets.chomp
puts "Which Line is that on? N, L or Six?"
line_end = gets.chomp.to_sym

index = 0
intersection = "Union Sq"

if line_start != line_end
	to_intersection = mta[line_start].index(intersection) - (mta[line_start].index(start_stop))
	
	from_intersection = (mta[line_end].index(intersection)) - (mta[line_end].index(end_stop))
	
	puts "#{to_intersection.abs() + from_intersection.abs()} stops."
else
	puts "#{(mta[line_start].index(start_stop) - mta[line_start].index(end_stop)).abs()} stops." 
end




