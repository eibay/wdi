function count_xx(str) {
	var n = 0;
	var j = 0;
	while (n < (str.length - 1)) {
		if (str.charAt(n) == "x" && str.charAt(n+1) == "x") {
			j += 1;
		}
		n = n + 1;
	}
	console.log(j);
}



count_xx("abcxx")
count_xx("xxx")
count_xx("xxxx")