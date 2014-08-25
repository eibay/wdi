def find_by(key, value, array)
	product = []
	array.each do |hash|
		if hash[key] == value
			product << hash
		end
	end
	product
end