

var myEach = function(array, code_block) {
	for (i = 0; i < array.length; i++) {
		code_block(array[i]);
	}
}



cast = ["Joey", "Monica", "Chandler", "Phoebe", "Ross", "Rachel"];

var shmee = function(friend) {
	console.log("I love the character " + friend + "!");
}

myEach(cast, shmee);