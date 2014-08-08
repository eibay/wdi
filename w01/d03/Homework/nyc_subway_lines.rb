 subways = { N: ["Times Square", "34th", "28th","23rd","Union Square", "8th"], 
	       Six: ["Grand Central" , "33rd" , "28th" , "23rd" , "Union Square", "Astor Place"],
             L: ["8th" , "6th" , "Union Square" , "3rd" , "1st"],
}

puts "The N, the six, the L?"

starting_line = gets.chomp

puts "Where you at?"

starting_stop = gets.chomp 

puts "Staying on or you outtie to the other train?"

ending_line = gets.chomp

puts "Where ya going?"

ending_stop = gets.chomp 

#Code doesnt work, I feel I am close. Below is the snippet of help I got working with Joe, above is my work. 
#Will refine tomorrow in class to make code pass.

starting_line = subways[:L]
starting_stop = subways[:L]

ending_line = subways[:L]
ending_stop = subways[:L]

if starting_line == ending_line

stops_total = (ending_stop - starting_stop).abs

else 

stops_total = (starting_line.index["Union Square"] - starting_stop.index).abs + (ending_line.index["Union Square"] - ending_stop.index).abs 

end

puts stops_total

