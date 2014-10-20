def twisted_fizzbuzz(num)

counter = 0
while counter < num
	if counter % 3 == 0 && counter % 5 == 0
		counter += 1
	elsif counter % 3 == 0
		puts counter
		counter += 1
	elsif counter % 5 == 0
		puts counter 
		counter += 1
	else 
		counter += 1
	end
end
end
puts "number please"

num = gets.chomp.to_i
twisted_fizzbuzz(num)
