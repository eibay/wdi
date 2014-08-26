def find_by(key, value, array)
	product = array.search {|hash| hash[key] == value}
end