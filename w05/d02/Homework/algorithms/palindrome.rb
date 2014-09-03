def palindrome(string)
	center = string.length / 2
	half1 = string[0..center]
	half2 = string[center..-1]
	if half1 == half2.reverse
		true
	else
		false
	end
end

puts palindrome("racecar")