// Sum 10

// Given 2 integers, return true if one if them is 10 or if their sum is 10.

// makes10(9, 10)
// // true
// makes10(9, 9)
// // false
// makes10(1, 9)
// // true

function makes10(num1, num2) {
	if (num1 + num2 == 10) {
		return true;
	}	else if (num1 == 10 || num2 == 10) {
		return true
	} else
	return false
}

console.log(makes10(9, 10));
console.log(makes10(9, 9));
console.log(makes10(1, 9));