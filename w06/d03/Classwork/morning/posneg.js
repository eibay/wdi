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

	if (product  < 0 && condition == false){
		return true
	} else if (num1 < 0 && num2 < 0 && condition == true ){
		return true
	} else {
		return false
	}
};





/*var n = 0;

while (n <= 100) {
	
	if (n % 3 == 0 && n % 5 ==0){
		console.log("FizzBuzz");	
	} else if (n % 3 == 0) {
		console.log("Fizz");
	} else if (n % 5 == 0) {
		console.log("Buzz");
	} else {
		console.log(n);
	};

	n = n + 1
}*/