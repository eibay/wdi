MTA = {  N:["N 34","N 28","N 23","Union Square", "N 8"],                                 
L:["L 8","L 6","Union Square", "L 3", "L 1"],                                   
Six:["Grand Central", "6 33", "6 28", "6 23", "Union Square", "Astor Place"]}  

puts("What train line do you want to take? Options: N, L, or the Six")
starting_line = gets.chomp.to_sym


puts("What station are you starting from? For the N options are: N 34, N 28, N 23, Union Square, N 8; For the L options are: L 8, L 6, Union Square, L 3, L 1 and for the Six options are: Six: Grand Central, 6 33, 6 28, 6 23, Union Square, Astor Place")
starting_station= gets.chomp

puts("What train line are you ending on? Options: N, L, or the Six")
ending_line = gets.chomp.to_sym

puts("What station are you ending on? For the N options are: N 34, N 28, N 23, Union Square, N 8; For the L options are: L 8, L 6, Union Square, L 3, L 1 and for the Six options are: Six: Grand Central, 6 33, 6 28, 6 23, Union Square, Astor Place")
ending_station = gets.chomp


index = "Union Square"
to_union_square = (MTA[starting_line].index("Union Square")  - MTA[starting_line].index(starting_station)).abs



from_union_square = (MTA[ending_line].index("Union Square") - MTA[ending_line].index(ending_station)).abs

puts (to_union_square.to_i + from_union_square.to_i)




# NStating_stop = ["N 34"]
# NEnding_stop = ["N 8"] 

# NLine[:stops].length




# LLine = {stops:["L 8","L 6","Union Square", "L 3", "L 1"]}
# SixLine = {stops:["Grand Central", "6 33", "6 28", "6 23", "Union Square", "Astor Place"]}







