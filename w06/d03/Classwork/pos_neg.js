// Given 2 integers, return true if one is negative and one is positive.

// posNeg(1, -1)
// # true
// posNeg(-1, 1)
// # true
// posNeg(-4, -5)
// # false

var posneg = function(number1, number2) {
	if (number1 > 0 && number2 < 0) {
		console.log("True");
	} else if (number1 < 0 && number2 > 0) {
		console.log("True");
	} else 
		console.log("False");
	};

posneg(1, -1);
posneg(-1, 1);
posneg(-4, -5);

// Enhancement: Given 2 integers, return true if one is negative and one is positive except if the third argument is true, then return true only if both are negative.

function posneg(num1, num2, condition){
	var product = num1 * num2;

	if (product < 0 && condition == false) {
		return true
	} else if (num1 < 0 && num2 < 0 && condition == true) {
		return true
	} else {
		return false
	};
};