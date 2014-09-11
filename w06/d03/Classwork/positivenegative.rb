def posNeg(a, b, c)
	if (a > 0 && b < 0) && (c == false)
		puts "true"
	elsif a < 0 && b > 0 && (c == false)
		puts "true"
	elsif a < 0 && b < 0 && (c == true)
		puts "true"
	else
		puts false
	end
end

posNeg(1, -1, false)
posNeg(1, 1, false)
posNeg(1, 1, true)
posNeg(-3, -1, true)
			