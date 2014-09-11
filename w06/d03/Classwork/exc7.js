
function numsBetween(num1, num2) {
	var arrayOfNums = [];

	while (num1 < (num2 - 1)) {
		num1 += 1;
		arrayOfNums.push(num1);
	}
	return arrayOfNums;
}



console.log(numsBetween(2, 6));