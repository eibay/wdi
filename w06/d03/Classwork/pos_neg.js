var pos_neg = function(a, b) {
	if (a < 0 && b > 0 ) {
		return true; 
	} 
	else if (a>0 && b < 0) {
		return true;
	} else {
		return false;
		};
}


// ________alt solution _______


function pos_neg(num1, num2){

	var product = num1 * num2;
	
	if (product < 0){
		return true;
	} else {
		return false;
	};
};

console.log(pos_neg(1, -5));
console.log(pos_neg(-2, -5));
console.log(pos_neg(3, 6));
console.log(pos_neg(-2, 3));


// ___________ enhancement ___________