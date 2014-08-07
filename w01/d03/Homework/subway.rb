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

if(start_line==stop_line)
	total_distance=subways[start_line].index(start)-subways[stop_line].index(stop)
puts "You will travel #{total_distance.abs} stops"
else
first_distance=subways[start_line].index(start)-subways[start_line].index(union_square)
second_distance=subways[stop_line].index(union_square)-subways[stop_line].index(stop)
final_distance= first_distance.abs+second_distance.abs
puts "You will travel #{final_distance} stops."
end




