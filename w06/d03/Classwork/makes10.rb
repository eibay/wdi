def makes10(a,b)
	if a + b == 10
		puts "true"
	elsif (a + b) - 10 == a || (a + b) - 10 == b
		puts "true"
	else
		puts "false"
	end
end

makes10(9, 10)

makes10(9, 9)

makes10(1, 9)
