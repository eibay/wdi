require "pry"

def xxpairs(str)
	i = 0
	hits = 0
	while i < str.length
		if str[i] == "x"
			hits += 1 if str[i + 1] == "x"
		end
		i += 1
	end
	hits
end

