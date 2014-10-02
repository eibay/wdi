var shmee = function(someStr) {
	console.log("You said: " + someStr);
}

var anotherFuntion = function() {
	shmee("Blah")
}

setTimeout(anotherFuntion, 2000);

shmee("Jeff")