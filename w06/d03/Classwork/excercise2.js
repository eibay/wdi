


function count_xx(str) {
	var i = 0;
	var john = 0;

	while (i<str.length) {
		if (str.charAt(i) == 'x' && str.charAt(i+1) == 'x') {
			john += 1;
		}
		i += 1;
	}
	return john;
}



console.log(count_xx("abcxx"));
console.log(count_xx("xxx"));
console.log(count_xx("xxxx"));

