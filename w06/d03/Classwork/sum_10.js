
var sum_10 = function(number_1, number_2){
	if (number_1 + number_2 == 10) {
		return true;
	} else if (number_1 == 10){
		return true;
	} else if (number_2 == 10){
		return true;
	} else 
		return false;
};


console.log(sum_10(9, 10));
console.log(sum_10(9, 9));
console.log(sum_10(1, 9));