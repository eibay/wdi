def pos_neg(a, b)
	if a < 0 && b > 0 
		return true
	elsif a>0 && b < 0 
		return true
	else 
		return false
	end 
end


puts pos_neg(1, -5) 
puts pos_neg(-2, -5)
puts pos_neg(3, 6)
puts pos_neg(-2, 3)



		