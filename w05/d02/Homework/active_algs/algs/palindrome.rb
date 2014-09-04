require "pry"

def palindrome(string)
	string == string.reverse
end

def palindromic_phrase(string)
	string.downcase.gsub(/\W/, "") == string.downcase.gsub(/\W/, "").reverse
end


binding.pry