require 'pry'

subways= { N: ["Times Square", "34th", "28th","23rd","Union Square", "8th"], 
	      Six: ["Grand Central" , "33rd" , "28th" , "23rd" , "Union Square", "Astor Place"],
          L: ["8th" , "6th" , "Union Square" , "3rd" , "1st"],
          Q: ["Times Square", "Herald Square", "Union Square" , "Canal Street"]
}
puts "What line do you want to start on?"

start_line= gets.chomp.to_sym
puts "What is your stop?"
start= gets.chomp
puts"What Line will you end on?"
stop_line= gets.chomp.to_sym
puts "What is your final stop?"
stop = gets.chomp

union_square="Union Square"

def stops(line, stop1 , stop2 , subway_lines)
	

	 total_distance=(subway_lines[line].index(stop1)-subway_lines[line].index(stop2)).abs

end
if  start_line==stop_line
binding.pry
	total_stops=stops(start_line, start, stop, subways)
	
else

	total_stops=stops(start_line, start, union_square, subways)+stops(stop_line, union_square , stop , subways)
	
end

puts "You will travel #{total_stops} stops"

# if(start_line==stop_line)
# 	total_distance=subways[start_line].index(start)-subways[stop_line].index(stop)
# else
# first_distance=subways[start_line].index(start)-subways[start_line].index(union_square
# second_distance=subways[stop_line].index(union_square)-subways[stop_line].index(stop)
# final_distance= first_distance.abs+second_distance.abs
# puts "You will travel #{final_distance} stops."

# end