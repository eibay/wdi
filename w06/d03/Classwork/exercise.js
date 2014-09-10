



var posNeg = function(number_1, number_2) {
	if (number_1<0 && number_2<0) {
		console.log("false");
	} else if (number_1<0) {
		console.log("true");
	} else if (number_2<0) {
		console.log("true");
	};
};


posNeg(1,-1)
posNeg(-1,1)
posNeg(-4,-5)