function pos_neg(x, y, z) {
	if ((x * y < 0 && z == false) || (x < 0 && y < 0 && z == true))
	{
		console.log(true)
	} else {
		console.log(false)
	};
};

pos_neg (-1, 2, false)
pos_neg (1, 3, false)
pos_neg (-1, -4, true)