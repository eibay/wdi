def count_xx(x)
	num = x.count("xx") / 2
	if num % 2 != 0
		return num + 1
	else
		return num
	end
end