 function posNeg(a, b, c) {
	if (a > 0 && b < 0 && c == false) {
		console.log("true");
	} else if (a < 0 && b > 0 && c == false) {
		console.log("true");
	} else if (a < 0 && b < 0 && c == true) {
		console.log("true");
	}	else {
		console.log("false");
	};
};



posNeg(1, -1, false)
posNeg(1, 1, false)
posNeg(1, 1, true)
posNeg(-3, -1, true)