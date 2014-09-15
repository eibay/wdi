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

var makes10 = function(x, y) {
	if (x == 10 || y == 10) {
		return true
	} else if (x + y == 10) {
		return true
	} else {
		return false
	};
}

console.log(makes10(9, 10))
console.log(makes10(9, 9))
console.log(makes10(1, 9))

var withoutEnd = function(string) {
	string = string.slice(1, -1)
	return string
};
console.log(withoutEnd('Hello'))
console.log(withoutEnd('java'))
console.log(withoutEnd('coding'))

var makeTags = function(tag, string) {
	return '<' + tag + '>' + string + '<' + tag + '>'
};
console.log(makeTags('i', 'Yay'))
console.log(makeTags('i', 'Hello'))
console.log(makeTags('cite', 'Yay'))

var maxOfThree = function(x, y, z) {
	if (x > y && x > z) {
		return x
	} else if (y > x && y > z) {
		return y
	} else {
		return z
	};
}

console.log(maxOfThree(8, 7, 6))

var inBetween = function(x, y) {
	var counter = x
	while (counter < y - 1) {
		counter+=1
		console.log(counter)
}
};

inBetween(2, 6)

function filterLongWords(int, arr) {
	list = []
	for (var i=0; i < arr.length; i++){
		if (arr[i].length > int) {
			list.push(arr[i]);
		}
	}
			console.log(list)
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])

var initials = function(string)




