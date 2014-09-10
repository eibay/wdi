def pos_neg (x, y, z)
	if ((x >= 0 && y < 0) || (y >= 0 && x < 0)) || (x < 0 && y < 0 && z == true)
		return true
	else
		return false
	end
end
