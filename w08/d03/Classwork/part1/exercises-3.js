// Create a function that takes an array of names and console.logs "hello name" for each name


function arrayOfNames(someName) {
	for (var i=0; i<someName.length; i++) {
		console.log("Hello " + someName[i])
	}
}

var arr = ["Brenda", "Lisa", "Jeff", "Jill"]
arrayOfNames(arr);

// forEach

var arr = ["Brenda", "Lisa", "Jeff", "Jill"]

function arrayOfNames(someName) {
		console.log("Hello " + someName);
}

arr.forEach(arrayOfNames);


// Create a function that takes an array of names and returns a new array with "hello [name]" for each name

var arr = ["Brenda", "Lisa", "Jeff", "Jill"]

function newArrayOfNames(someName) {
var emptyArr = []
	emptyArr.push("Hello " + someName)
	return emptyArr
}

// newArrayOfNames(["jeff", "lisa"])
// ["hello jeff", "hello lisa"]
