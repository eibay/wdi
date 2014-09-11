var posNeg = function(x, y) {

	if ((x < 0 && y > 0) || (x > 0 && y < 0)) {
		console.log("true")
	} else {
		console.log("false")
	}
}

posNeg(1, -1)
posNeg(-1, 1)
posNeg(-4, -5)

var posNegBoo = function(x, y, boo) {

	if (boo == true) {
		if (x < 0 && y < 0) {
			console.log(true)
		} else {
			console.log(false)
		}
	}
	else {
		if ((x < 0 && y > 0) || (x > 0 && y < 0)) {
			console.log(true)
		} else {
			console.log(false)
		}
	}
}
posNegBoo(1, -1, false)
// true
posNegBoo(1, 1, false)
// false
posNegBoo(1, 1, true)
// false
posNegBoo(-3, -1, true)
