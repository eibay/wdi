var args = process.argv

function numsBetween(num1, num2) {
	var arrayOfNums = [];

	while (num1 < (num2 - 1)) {
		num1 += 1;
		arrayOfNums.push(num1);
	}
	return arrayOfNums;
}


console.log(numsBetween(parseInt(args[2]),parseInt(args[3])));

// type into terminal...

// $ node exc7.js 2 6