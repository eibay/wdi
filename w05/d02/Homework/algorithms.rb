require 'pry'



	def count_xx(string)

	array=string.chars.to_a
	previous_char=""
	count=0
	array.each do |n|
		if(n=="x")
			if n==previous_char
				count+=1

			end
		end
		previous_char=n
		
	end
	return count


end

def zeroFront(array)
	zero_array=[]
	new_array=[]
	array.each do |number|
		if(number==0)
			zero_array.push(0)
		
	else
		new_array.push(number)
	end
	end
		return zero_array+new_array

end

def countr(string, alphabet)

	split=string.chars.to_a
	counter=0
	split.each do |n|
		counter+=alphabet.find_index(n)+1
	end
	return counter
end


def palindrome(string)

if(string==string.reverse)
	return true
else
	return false
end
end

def make_chocolate(small, big, goal)

	big_kilo=big*5
	remainder=goal%big_kilo

	if(small >= remainder)
		return remainder
	else
		return -1
	end
	
end


alphabet="a".."z"
alphabet=alphabet.to_a
binding.pry