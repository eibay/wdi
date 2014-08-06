subway = {
	

	"N" => {
		"Times Square" => 4,
		"34th" => 3,
		"28th" => 2,
		"23rd" => 1,
		"Union Square" => 0,
		"8th" => -1
	},

	
	"6" => {
		"Grand Central" => 4,
		"33rd" => 3,
		"28th" => 2,
		"23rd" => 1,
		"Union Square" => 0,
		"Astor Place" => -1
	},

	
	"L" => {
		"1st" => 2,
		"3rd" => 1,
		"Union Square" => 0,
		"6th" => -1,
		"8th" => -2
	},

	"Q" => {
		"Times Square" => 2,
		"Herald Square" => 1,
		"Union Square" => 0,
		"Canal Street" => -1

	}


}

puts "Enter Start Line"
start_line = gets.chomp.to_s

puts "Enter Start Stop"
start_stop = gets.chomp.to_s

puts "Enter End Line"
end_line = gets.chomp.to_s

if end_line	== start_line 
	puts "Enter End Stop"
	end_stop = gets.chomp.to_s

	number_of_stops = subway[start_line][start_stop] - subway[end_line][end_stop]

	puts "You have #{number_of_stops.abs} stops."

else
	puts "Enter End Stop"
	end_stop = gets.chomp.to_s

	number_of_stops = (subway[start_line][start_stop]).abs + (subway[end_line][end_stop]).abs

	puts "You have #{number_of_stops} stops."

end








