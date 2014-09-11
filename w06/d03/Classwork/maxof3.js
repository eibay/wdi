function maxOfThree(a, b, c) {
	if (a > b && a > c) {
		console.log(a)
	}
	else if (a < b && b > c) {
		console.log(b)
	}
	else {
		console.log(c)
	}
}

maxOfThree(1, 4, 6)