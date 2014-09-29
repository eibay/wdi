var friends = ["Joey", "Chandler", "Rachel"]

var myEach = function(arr, functionWePassIn) {
	for(var i=0; i < arr.length; i++) {
		functionWePassIn(arr[i]);

	};
}

var schmee = function(monkey_eggs) {
	console.log("I love the character" + monkey_eggs)
}

myEach(friends, schmee);