
def posneg(one, two)
	if one > 0 && two > 0
		return false
	elsif one > 0 && two < 0 || one < 0 && two > 0
		return true
	end
end

def posneg(one, two)
	if one > 0 && two < 0 || one < 0 && two > 0
		return true
	else
		return false
	end
end


