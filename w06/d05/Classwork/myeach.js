var friends = ["Ross", "Joey", "Chandler", "Monica", "Rachel", "Phoebe"];
var random= ["1,2,3,4"]
  					// array || function we are passing through
var myeach = function(friends, shmee, blah) {
	var i = 0
	while (i < friends.length) {
		shmee(friends[i]);
		i++;
	}
}

var shmee = function(x){
	console.log("I really enjoy the character " + x);
}

var blah = function(y){
	console.log(y + " I declare a thumb war");
}

myeach(friends, shmee);
myeach(random, blah);