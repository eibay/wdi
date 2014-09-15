var shmee = function(someStr) {
  console.log(" You said: " + someStr);
}

var anotherFunction = function() {
  shmee("Blah")
}

setTimeout(anotherFunction, 2000); // referencing function

shmee("jeff") // calling function

// referencing and calling functions in js are fundamentally different, in ruby they are the same.

// You said: jeff

// You said: undefined.

// We execute it once, when we write shmee("jeff") and setTimeout does so on its own