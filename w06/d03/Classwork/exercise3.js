
function makes10(num1, num2){

	if (num1 || num2 == 10){

					return true

	} else {

					return false
	};

	if (num1 + num2 == 10){

					return true

	} else {

					return false
	};
};


makes10(9, 10)
// true
makes10(9, 9)
// false
makes10(1, 9)
// true