maxOfThree(1, 4, 6)
// 6

// function maxOfThree(x,y,z){
// 	var max = Math.max(x,y,z);
// 	console.log(max);
// };

function maxOfThree(x,y,z){
	var max;
	var first_large;
		if ( x > y ) {
			first_large = x
		} else { 
			first_large = y
		};
	var second_large;
		if ( first_large > z ){
			max = first_large
		} else { 
			max = z 
		};
		console.log(max);
};

function maxOfThree(num1,num2,num3) {
	if (num1 > num2) {
		if (num1 > num3) {
			return num1
		} else { 
			return num3 
	} else {
		if (num2 > num3) {
			return num2
		} else {
			return num3
		}
	}

};
