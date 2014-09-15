var friends = ["Monica", "Phoebe", "Joey", "Chandler", "Ross", "Rachel"]

var myEach = function(arr, theFunctionWePassIn) {
	arr.forEach(theFunctionWePassIn)
}
 var shmee = function(monkey_eggs) {
 	console.log("I love the character " + monkey_eggs);
 }

myEach(friends,shmee)