var friends = ["Joey", "Chandler", "Ross", "Monica", "Rachel", "Pheobe"]



var myEach = function(array, func){
	array.forEach(func)
}

var shmee = function(character){

	console.log("I love the character " + character);

}

myEach(friends, shmee)