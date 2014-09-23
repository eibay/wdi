require 'pry'

#=> small bars are 1 kilo 
#=> big bars are 5 kilos 

def make_chocolate s, b, g
	if g >= 5 
		until b == 0 
			g = g - 5 
			b -= 1 
		end 
	end 
	if g <= s
		return g  
	else 
		return -1 
	end 
end 


# bad tdd but for chocolate! # 

if make_chocolate(4, 1, 9) == 4
	puts "test 1 passed!" 
end 

if make_chocolate(4, 1, 10) == -1
	puts "test 2 passed!" 
end 


if make_chocolate(4, 1, 7) == 2 
	puts "test 3 passed!"  
end 

