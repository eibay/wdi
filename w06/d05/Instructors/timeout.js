var shmee = function(someStr) {
  console.log("You said: " + someStr);
}

var anotherFunction = function() {
  shmee("Blah")
}

setTimeout(anotherFunction, 2000);

shmee("Jeff");