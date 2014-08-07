

N = {
"Times Square" => 4,
"34" => 3,
"28" => 2,
"23" => 1,
"Union Square" => 0,
"8" => 1
}

L = {
"8" => 2,
"6" => 1,
"Union Square" => 0,
"3" => 1,
"1" => 2
}

Six = {
"Grand Cent" => 4,
"33" => 3,
"28" => 2,
"23" => 1,
"Union Square" => 0,
"Astor" => 1,
}

Q ={
"Times Square" => 2,
"Herald Square" => 1,
"Union Square" => 0,
"Canal St" => 1
}

puts "What line at you strating at?"
start_line = gets.chomp
if start_line == "Q"
	start_line = Q

puts "What station are you starting at"
start_station = gets.chomp

puts "What line do you want to end at?"
end_line = gets.chomp
f start_line == "Six"
	start_line = Six


puts "what station do you want to end at?"
end_station = gets.chomp

# start_line = Q
# start_station = "Times Square"
start_station.to_sym

to_Union_Square = start_line[start_station]


# end_line = Six
# end_station = "Astor" 
end_station.to_sym

from_union_square = end_line[end_station]


puts (to_Union_Square + from_union_square)



