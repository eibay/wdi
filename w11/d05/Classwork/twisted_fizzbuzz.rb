# // write a method twisted_fizzbuzz that takes a single number as an argument 
# // it should print out numbers divisible by 3 that are less than that number
# // it should print out numbers divisible by 5 that are less than that number
# // it should not print out number divisible by both 3 and 5 that are less than that number
# // it should not return anything

def twisted_fizzbuzz(num)

(1...num).each do |i|
	if i % 3 == 0 
	  puts i unless i % 5 == 0
	else 
		puts i if i % 5 == 0
	end
 end
end

twisted_fizzbuzz(50)


### jeff's solution

# def twisted_fizzbuzz(num)

# i = num - 1

# while i > 0

# 	if (i % 3 == 0) && (i % 5 == 0)
# 		## do nothing
# 	elsif i % 3 == 0
# 		puts i
# 	elsif i % 5 == 0
# 		puts i 
# 	end

# 	i -= 1
# end
# end
	
# twisted_fizzbuzz(50)



