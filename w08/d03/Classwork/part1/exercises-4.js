// Create a function that takes an array of names and returns a new array with "hello [name]" for each name


function newArrayOfNames(someName) {
var emptyArr = []
	for(var i = 0; i < someName.length; i++){
		emptyArr.push("Hello " + someName[i]);
	};

	return emptyArr;
};

var arr = ["Brenda", "Lisa", "Jeff", "Jill"]

console.log(newArrayOfNames(arr));

// newArrayOfNames(["jeff", "lisa"])
// ["hello jeff", "hello lisa"]