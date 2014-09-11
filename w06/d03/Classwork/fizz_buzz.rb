[*1..100].each do |a|
	if a % 3 == 0 && a % 5 == 0
		print "fizz buzz, "
	elsif a % 3 == 0 
		print "fizz, "
	elsif a % 5 == 0 
		print "buzz, "
	else 
		print "#{a}, " 
	end 
end 