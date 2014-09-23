// write a function howbig that takes a string as a parameter. The function returns:
// "small" if the string is less than 3 characters long
// "medium" if it is between 3 and 5 characters long
// "big" if it is greater than 5 characters long

function howbig(string) {
	if (string.length < 3) {
		return "small"
	} else if (string.length == 3) {
		return "medium"
	}	else if (string.length == 4) {
		return "medium"
	} else if (string.length == 5) {
	} else {
		return "big"
	}
};

console.log(howbig("no"));
