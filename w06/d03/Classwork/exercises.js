// var trueFalse = function(one, two) {
// if (one < 0 || two < 0) {
// console.log(true);
// } else if (one < 0 && two < 0) {
// console.log(false);
// } else {
// console.log(false);
// };
// };

function posNeg(num1, num2) {
	var product = num1 * num2;
	if (product < 0) {
		return true
	} else {
		return false
	}
};

function posNeg(num1, num2, condition) {
	var product = num1 * num2;
	if (product < 0 && condition == true) {
		return true;
	} else if (num1 < 0 && num2 < 0 && condition == true) {
		return true
	} else {
		return false
	}
};

var trueFalse = function(one, two, three) {
	if (one < 0 && two < 0 && three == true) {
		console.log(true);
	} else if (one < 0 || two < 0) {
		console.log(true);
	} else if (one < 0 && two < 0) {
		console.log(false);
	} else {
		console.log(false);
	};
};