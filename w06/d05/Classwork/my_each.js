var friends = ["Joey", "Ross", "Rachel", "Monica", "Phoebe", "Chandler"];

var myEach = function(arr, theFunctionWePassIn) {
	for(var i = 0; i < arr.length; i++) {
		theFunctionWePassIn(arr[i]);
	}
}

var loveChar = function(name) {
	console.log("I love the character " + name);
}

myEach(friends, loveChar);