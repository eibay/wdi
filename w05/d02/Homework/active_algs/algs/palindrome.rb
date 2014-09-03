require "pry"

def palindrome(string)
	string == string.reverse
end

binding.pry