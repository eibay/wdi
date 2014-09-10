

def count_xx(str)
	n = 0
	x = 0
	while n <= (str.length)
		if str[n, n + 1] == "xx"
			x += 1
		end
		n += 1
	end
	puts x
end



count_xx("abcxx")
count_xx("xxx")
count_xx("xxxx")