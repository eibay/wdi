function count_xx(str) {
	var n = 0
	var x = 0
	{while (n <= str.length) {
		if (str[n, n + 1] == "xx") {
			x = x + 1
		}
		n = n + 1
	}
	console.log(x);
}



count_xx("abcxx")
count_xx("xxx")
count_xx("xxxx")