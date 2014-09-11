// # Define a function maxOfThree that takes three numbers as arguments and returns the largest of them

// # maxOfThree(1, 4, 6)
// # // 6

function maxOfThree(num1, num2, num3) {
	array = [num1, num2, num3]

	array.sort().reverse()
		return array[0]
	}

console.log(maxOfThree(1, 4, 6));


// longform

function maxOfThree(num1, num2, num3) {

	if (num1 > num2) {
		if (num1 > num3) {
			return num1
		} else {
			return num3
		}
	} else {
		if (num2 > num3) {
			return num2
		} else {
			return num3
		}
	} 
};

console.log(maxOfThree(1, 4, 6));