require 'pry'

def posNeg (x, y)

	if x > 0 && y < 0
		return true
	elsif x < 0 && y > 0
		return true
	else
		return false
	end

end
binding.pry


#PART 2


def count_xx (string)
	i = 0
	count = 0

	while i < string.length
		if string[i] == 'x' && string[i+1] == 'x'
			count += 1
		end
	i += 1
	end

	return count
end


#PART 3

def makes10(num1, num2)

	if num1 == 10
		return true
	elsif num2 == 10
		return true
	elsif num1 + num2 == 10
		return true
	else
		return false
	end

end

#PART 4

def withoutEnd(string)

end


#PART 6

def maxOfThree (x,y,z)

	if x > y
		if x > z
			return x
		elsif z > x
			return z
		end
	elsif y > z
		return y
	else
		return z
	end

end


#PART 8

def filterLongWords(i, array)

	long_words = []
	
	array.each do |word|
		if word.length >= i
			long_words.push(word)
		end
	end
	puts long_words

end


#PART 9

def initials(string)
	names = string.split(' ')
	
	initials = ''

	names.each do |name|
		initials << name[0]
	end

	return initials
end



#PART 10

friends=["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer"]

def cast
	return friends.sample
end

















