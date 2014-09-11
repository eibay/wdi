function initials(str) {
	var inc = 0;
	var output = str.charAt(0)
	while (inc < str.length) {
		if (str.charAt(inc) == " ") {
			output = output + str.charAt(inc + 1)
		}
		inc = inc + 1
	}
	return output
}

ans = initials('Neel Jayendra Patel');
console.log(ans);