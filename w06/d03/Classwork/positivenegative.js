
 //  def truefalse(one, two)
 //  	if one < 0 || two > 0
	// 		return true
 //  	elsif one < 0 && two < 0 
 //  		return false
	// else
	// 		return false
 //  	end
 // end
  		


function posNeg(num1, num2){
	var product = num1 * num2;

	if (product < 0){
		return true
	} 	else {
		return false
	};
};

function posNeg(num1, num2, condition){
	var product = num1 * num2;

	if (product < 0 && condition == false){
		return true
	}	else if (num1 < 0 && num2 < 0 && condition == true ) {
		return true
	}	else {
		return false
	};
};


// var truefalse = function(one, two) {
// 	console.log(one, two);
// };

// 	if ( one < 0 || two > 0){
// 		console.log("true");
// 	} else if (one < 0 && two < 0) {
// 		console.log("false");
// 	} else {
// 		console.log("false");
// 	};

