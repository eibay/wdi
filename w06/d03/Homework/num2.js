var countxx = function(string) {

var x1 = 0
var x2 = 1
var total = 0
var counter = 0

while (counter < string.length) {
	if (string.charAt(x1) == "x" && string.charAt(x2) == "x") {
		total = total + 1
		};
	x1 = x1 + 1
	x2 = x2 + 1
	counter = counter + 1
}
console.log(total)

}

countxx("abcxx")
countxx("abcxxxxx")
