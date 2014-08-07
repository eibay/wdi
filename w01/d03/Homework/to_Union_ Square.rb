N = {
"Times Square" => 4,
"34" => 3,
"28" => 2,
"23" => 1,
"Union Square" => 0,
"8" => 1
}


start_line = N
start_station = "Times Square"
start_station.to_sym

to_Union_Square = start_line[start_station]

puts to_Union_Square