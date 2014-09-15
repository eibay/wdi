var friends = ["Homer", "Marge", "Bart", "Lisa",]

var myEach =function(arr, functionwepass) {
	arr.forEach(functionwepass)
}

var shmee = function(monkey_eggs) {
	console.log("I love the character " + monkey_eggs);
}

myEach(friends, shmee)


