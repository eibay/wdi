function count_xx(str) {
	var index = 0;
	var total = 0;
	while (index < str.length) {
		if (str.charAt(index) == "x" && str.charAt(index + 1) == "x") {
			total = total + 1
		} index = index + 1
	}
	return total
}

console.log(count_xx("xxx"))