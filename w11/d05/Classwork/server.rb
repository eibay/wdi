def twisted_fizzbuzz(num)
	for i in 0..num
		if (i%3 == 0 && i<num) && (i%5 == 0 && i<num)
			i = i + 1
	    elsif i%3 == 0 && i<num
	     	print i
	    elsif i%5 == 0 && i<num
	    	print i
	    end
	end
end

twisted_fizzbuzz(100)