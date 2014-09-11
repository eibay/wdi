var makes10 = function(x, y) {
	if (x == 10 || y == 10) {
		return true
	} else if (x + y == 10) {
		return true
	} else {
		return false
	};
}

console.log(makes10(9, 10))
console.log(makes10(9, 9))
console.log(makes10(1, 9))