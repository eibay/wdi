var maxOfThree = function(x, y, z) {
	if (x > y && x > z) {
		return x
	} else if (y > x && y > z) {
		return y
	} else {
		return z
	};
}

console.log(maxOfThree(8, 7, 6))