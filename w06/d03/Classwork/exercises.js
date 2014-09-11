// var posNeg = function(x, y) {

// 	if ((x < 0 && y > 0) || (x > 0 && y < 0)) {
// 		console.log("true")
// 	} else {
// 		console.log("false")
// 	}
// }

// posNeg(1, -1)
// posNeg(-1, 1)
// posNeg(-4, -5)

// var posNegBoo = function(x, y, boo) {

// 	if (boo == true) {
// 		if (x < 0 && y < 0) {
// 			console.log(true)
// 		} else {
// 			console.log(false)
// 		}
// 	}
// 	else {
// 		if ((x < 0 && y > 0) || (x > 0 && y < 0)) {
// 			console.log(true)
// 		} else {
// 			console.log(false)
// 		}
// 	}
// }
// posNegBoo(1, -1, false)
// // true
// posNegBoo(1, 1, false)
// // false
// posNegBoo(1, 1, true)
// // false
// posNegBoo(-3, -1, true)


var xx = function(string) {

var x1 = 0
var x2 = 1
var total = 0
var counter = 0

while (counter < string.length) {
	if (string[x1] == "x" && string[x2] == "x") {
		total = total + 1
		};
	x1 = x1 + 1
	x2 = x2 + 1
	counter = counter + 1
}
console.log(total)

}

xx("abcxx")
xx("abcxxxxx")