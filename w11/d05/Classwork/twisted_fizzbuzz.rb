def twisted_fizzbuzz(num)
	i = 0
	while i < num
		unless i % 3 == 0 && i % 5 == 0
			if i % 3 == 0
				puts i
			elsif i % 5 == 0
				puts i
			end
		end
		i += 1
	end
end

twisted_fizzbuzz(921)