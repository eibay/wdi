require "pry"

# def zeroFront(arr)
# 	arr.sort
# end

# I decided to do one without .sort

def zeroFront(arr)
	output = []
	arr.each do |num|
		if num == 0
			output.insert(0, 0)
		else
			output << num
		end
	end
	output
end

binding.pry