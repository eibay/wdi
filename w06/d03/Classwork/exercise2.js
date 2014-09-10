function count_xx(str) {
	var i = 0;
	var count = 0;
	while (i < str.length) {
		console.log(str.charAt(i));
		if(str.charAt(i) == "x" && str.charAt(i + 1) == "x") {
			count++;
		}
		i += 1;
	}
	return count;
}

