def count_xx(string)
	return string.scan(/(?=xx)/).length
end

puts count_xx("abcxx")
puts count_xx("xxx")
puts count_xx("xxxx")
puts count_xx("abcxxx123xx2x")