var posNeg = function(a, b) {
	if (a < 0 && b > -1) {
		return true
	} else if (a > -1 && b < 0) {
		return true
	} else {
		return false
	}
}

console.log(posNeg(1, -1));
console.log(posNeg(-1, 1));
console.log(posNeg(-4, -5));


function posNegPlus(a, b, c) {
	if (a < 0 && b > -1 && c == false) {
		return true
	} else if (a > -1 && b < 0 && c == false) {
		return true
	} else if (a < 0 && b < 0 && c == true) {
		return true
	} else {
		return false
	}
}

var x = posNegPlus(1, -1, false)
console.log(x)

var x = posNegPlus(1, 1, false)
console.log(x)

var x = posNegPlus(1, 1, true)
console.log(x)

var x = posNegPlus(-3, -1, true)
console.log(x)
