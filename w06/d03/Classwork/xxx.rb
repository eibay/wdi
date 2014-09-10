# Count the number of "xx" in the given string. 
# We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

#   count_xx("abcxx")
#   // 1
#   count_xx("xxx")
#   // 2
#   count_xx("xxxx")
#   // 3


def count_xx(string) 
	count = string.count('xx')
	puts count
end