var friends = ["Joey", "Phoebe", "Chandler", "Rachel"]

var myEach = function(arr, theFunction) {
	for (var i = 0; i < arr.length; i++) {
		character = arr[i];
		theFunction(character);
	}
}

var shmee = function(character) {
	console.log("I love the character " + character);
}

myEach(friends, shmee);


// var myEach = function(arr, theFunction) {
// 	for (var i = 0; i < friends.length; i++) {
// 		character = friends[i];
// 		return character;
// 	}

// }

// var shmee = function(character) {
// 	console.log("I love the character " + character);
// }

// myEach(friends, shmee);