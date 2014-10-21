def twisted(number)
	(1...number).each do |num|
		if((num%3==0)||(num % 5==0))&&(((num % 3 == 0)&&(num%5==0)) == false)
			puts num
		end
	end
end

twisted(21)
