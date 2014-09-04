num_array = [*1..100]
prime_nums = [2, 3, 5, 7]

num_array.each do |x|
	if x % 2 != 0 && x % 3 != 0 && x % 4 != 0 && x % 5 != 0 && x % 6 != 0 && x % 7 != 0 && x % 8 != 0 && x % 9 != 0 
		prime_nums << x
	end
end

puts prime_nums

