require 'pry'
def posNeg(num, num2)

	if(num2 > 0)&&(num < 0)
		return true
	elsif(num > 0)&&(num2 < 0)
		return true
	else
		return false
end
end

def posNeg2(num, num2, boolean)
	if(boolean==true)
		if(num2 < 0)&&(num < 0)
			return true
		else
			return false
		end
	else

	if(num2 > 0)&&(num < 0)
		return true
	elsif(num > 0)&&(num2 < 0)
		return true
	else
		return false
end
end
end

binding.pry