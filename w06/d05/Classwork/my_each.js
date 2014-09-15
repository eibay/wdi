var friends = ["Joey", "Phoebe", "Ross", "Rachel", "Monica", "Chandler"];
var shmee = function(friend) {
	console.log("I love the character " + friend);
};


var myEach = function(arr, process) {
	for ( var i = 0; i < arr.length; i++) {
		process(arr[i])
};
};

myEach(friends, shmee)
