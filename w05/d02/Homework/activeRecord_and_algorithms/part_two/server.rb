require 'pry'

############
###Part 1###
############

# def count_xx(str)
# 	num = str.count("x")
# 	puts num - 1
# end

# puts count_xx("xxxxxxxxx")

#####################################

############
###Part 2###
############

# def make_chocolate(small, big, goal)
# 	big = big * 5
# 	if (goal - big) > small
# 		return -1
# 	elsif (goal - big) < small
# 		return (goal - big)
# 	elsif (goal - big) == small
# 		return small
# 	else
#   		return small - (goal - big)
#   	end
# end

# puts make_chocolate(1, 1, 8)

def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

# assert(make_chocolate(2,2,13), -1)
# assert(make_chocolate(3,2,13), 3)
# assert(make_chocolate(3,3,13), 3)
# assert(make_chocolate(10,1,13), 8)

#####################################

############
###Part 3###
############

# def zeroFront(ary)
# 	return ary.sort {|a, b| a <=> b }
# end

# print zeroFront([0, 3, 0, 6, 1, 7, 0])

#####################################

############
###Part 4###
############


# def countr(string)
# 	alphabet = ('a'..'z').to_a
# 	string = string.chars
# 	num = ""

# 	string.each do |letter|
# 		num = alphabet.find_index(letter)
# 		num += num
# 	end
# 	return num
# end

# puts countr("happy")

#####################################

############
###Part 5###
############

# def palindrome(str)
# 	if str == str.reverse
# 		return true
# 	else
# 		return false
# 	end
# end	

# puts palindrome("racecar")

#####################################



















