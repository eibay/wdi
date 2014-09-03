num_array = [*1..100]
odd_nums = []

num_array.each do |x|
	if x % 2 != 0
		odd_nums << x
	end
end

