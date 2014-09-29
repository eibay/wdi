function joke () {
	return "how many flies does it take to screw in a lightbulb?  two!"
}
console.log(joke())

function greet (name) {
	return "Hello " + name
}
console.log(greet("Peter"))

var string = ""
function party (arr) {
	for (i=0; i<arr.length; i++) {
		string = "Hello " + arr[i]
		console.log(string)
	}
}

var names = ["Tom", "Dick", "Harry"]
party(names)


function partyArr (arr) {
	var newNameArr = []
	for(i=0; i<arr.length; i++) {
		newNameArr.push("Hello " + arr[i])
	}
	return newNameArr
}

console.log(partyArr(names))

function xdouble (num) {
	return num * 2
}

console.log(xdouble(37))

function quadruple (num) {
	return xdouble(xdouble(num))
}
console.log(quadruple(7))

var color = new Object();
color["Tom"] = "Red"
color["Dick"] = "Blue"
color["Harry"] = "Yellow"

function fave (hash) {
	for(i=0; i<Object.keys(hash).length; i++) {
		console.log(Object.keys(hash)[i] + "'s favorite color is " + hash[Object.keys(hash)[i]])
	}
}

fave(color)
var color2 = new Object();
color2["Moe"] = "Purple"
color2["Larry"] = "Green"
color2["Curly"] = "Orange"

function merge (hash1, hash2) {
	var hash3 = new Object();
	for(i=0; i<Object.keys(hash1).length; i++) {
		hash3[Object.keys(hash1)[i]] = hash1[Object.keys(hash1)[i]]
	}
	for(i=0; i<Object.keys(hash2).length; i++) {
		hash3[Object.keys(hash2)[i]] = hash2[Object.keys(hash2)[i]]
	}
	return hash3
}

console.log(merge(color, color2))