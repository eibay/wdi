

# i = 99
# while i > 0 
# 	puts "#{i} #{measure} of #{object} on the wall"
# 	puts "#{i} #{measure} of #{object}"
# 	puts "take 1 down, pass it around"
# 	puts "#{i-1} #{measure} of #{object} on the wall"

# 	i -= 1
# end

def beersong(i, measure, object, prep, location)
	while i > 0 
		puts "#{i} #{measure} of #{object} #{prep} the #{location}"
		puts "#{i} #{measure} of #{object}"
		puts "take 1 down, pass it around"
		puts "#{i-1} #{measure} of #{object} #{prep} the #{location}"

		i -= 1
	end
end

beersong(5, "crowds", "tourists", "in", "times square")
beersong(3, "hordes", "zombies", "on", "road")
