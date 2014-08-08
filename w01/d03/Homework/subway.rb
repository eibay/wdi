nline = {"times square" => 4, "34th" =>3, "n28" => 2, "n23" => 1, "nus" => 0, "n8" => 1}
sixline = {"grand central" => 4, "33rd" => 3, "28th" => 2, "23rd" => 1, "union square" => 0, "astor place" => 1}
lline = {"l8" => 2, "6th" => 1, "lus" => 0, "3rd" => 1, "1st" => 2}
qline = {"qts" => 2, "herald square" => 1, "qus" => 0, "canal street" => 1}

#get start_line from user
puts("On which line are you starting? Please choose from the L, N, 6, or Q lines.")
start_line = gets.chomp.downcase
if (start_line == "6") || (start_line == "six")
	start_line = sixline
elsif start_line == "l"
	start_line = lline
elsif start_line == "n"
	start_line = nline
elsif start_line == "q"
	start_line = qline
else
	puts("please try again")
end

#get start_station from user
puts("At which station are you starting?")
	if start_line == sixline
		puts("Please choose from Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place")
	elsif start_line == lline
		puts("Please choose from 8th, 6th, Union Square, 3rd, or 1st.")
	elsif start_line == nline
		puts("Please choose from Times Square, 34th, 28th, 23rd, Union Square, or 8th.")
	elsif start_line == qline
		puts("Please choose from Times Square, Herald Square, Union Square, or Canal Street")
	end
	start_station = gets.chomp.downcase
	#convert input to key names
	if start_line == nline
		if start_station == "28th"
			start_station = "n28"
		elsif  start_station == "23rd"
			start_station = "n23"
		elsif  start_station == "union square"
			start_station = "nus"
		else
		end

	elsif start_line == lline
		if start_station == "8th"
			start_station = "l8"
		elsif start_station == "union square"
			start_station = "lus"
		else
		end

	elsif start_line == qline
		if start_station == "times square"
			start_station = "qts"
		elsif start_station == "union square"
			start_station = "qus"
		end
	end

#get stop_line from user	
puts("On which line are you stopping?")
stop_line = gets.chomp.downcase
if (stop_line == "6") || (stop_line == "six")
	stop_line = sixline
elsif stop_line == "l"
	stop_line = lline
elsif stop_line == "n"
	stop_line = nline
elsif stop_line == "q"
	stop_line = qline
else
	puts("please try again")
end
#get stop_station from user
puts("At which station are you stopping?")
if stop_line == sixline
	puts("Please choose from Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place")
elsif stop_line == lline
	puts("Please choose from 8th, 6th, Union Square, 3rd, or 1st.")
elsif stop_line == nline
	puts("Please choose from Times Square, 34th, 28th, 23rd, Union Square, or 8th.")
elsif stop_line == qline
	puts("Please choose from Times Square, Herald Square, Union Square, or Canal Street")
end
#convert input to key name
stop_station = gets.chomp.downcase
	if stop_line == nline
		if stop_station == "28th"
			stop_station = "n28"
		elsif  stop_station == "23rd"
			stop_station = "n23"
		elsif 
		 stop_station == "union square"
			stop_station = "nus"
		else
		end

	elsif stop_line == lline
		if stop_station == "8th"
			stop_station = "l8"
		elsif stop_station == "union square"
			stop_station = "lus"
		else
		end
	elsif stop_line == qline
		if stop_station == "times square"
			stop_station = "qts"
		elsif stop_station == "union square"
			stop_station = "qus"
		else
		end
		
	end



 if start_line == stop_line

start = start_line[start_station]
stop = stop_line[stop_station]


	distance = start - stop 
	distance.abs = distance_one_line
	puts("You will reach your destination in #{distance_one_line} stops.")

else
start = start_line[start_station]
stop = stop_line[stop_station]

distance = start + stop
end

puts("You will reach your destination in #{distance} stops.")
		
		

		

		