function count_xx(str) {
	var i = 0;

	var john = 0;
	while (i<str.length-1) {
		if (str.charAt(i) == 'x' && str.charAt(i+1) == 'x') {
			john += 1;
		}

		i+=1;
	}

	return john;
}

console.log(count_xx("abcxx"));
//1
console.log(count_xx("xxx"));
//2
console.log(count_xx("xxxx"));
//3


