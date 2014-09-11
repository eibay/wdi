// Part 1

function posNeg(num1, num2){
	var product = num1 * num2;

	if (product < 0){
		return true
	} else {
		return false
	};
};

function posNeg(num1, num2, condition){
	var product = num1 * num2;

	if (product < 0 && condition == false){
		return true
	} else if (num1 < 0 && num2 < 0 && condition == true  ) {
		return true
	} else {
		return false
	};
};