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
	big_bars_used = goal / 5
	if(big_bars_used > big)
		big_bars_used=big
	end
	remaining_weight=goal-(big_bars_used*5)
	big_kilo=big*5
	if(big_kilo > goal)&&(goal%5==0)
		return 0
		binding.pry
	elsif(small >= remaining_weight)
		return remaining_weight
	else
		return -1
	end
end


def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

 # assert(make_chocolate(2,2,13), -1)
 # assert(make_chocolate(3,2,13), 3)
 # assert(make_chocolate(3,3,13), 3)
  # assert(make_chocolate(10,1,13), 8)

  # assert(make_chocolate(1,2,9), -1)

alphabet="a".."z"
alphabet=alphabet.to_a
binding.pry