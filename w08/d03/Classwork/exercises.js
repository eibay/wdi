// Create a function that returns a string with a joke.

function string() {
	return("joke goes here")
}


// Create a function that takes a name and returns "hello [name]"
function name(x) {
	return "Hello " + x
}
name("Jeff")

// Create a function that takes an array of names and console.logs "hello name" for each name

function nameGreeting(something) {
	var i = 0;

	while (i < something.length) {
		console.log("Hello " + something[i]);
		i +=1;
	}
}


function nameGreeting(something) {
	for(var i = 0; i<something.length; i++) {
		console.log("Hello " + something[i]);
	}
}


nameGreeting(["jeff", "lisa"])
nameGreeting(["brenda", "jill"])

// Hello jeff
// Hello lisa

// print 10!, 9!...1!

n = 10

while (n > 0) {
	console.log(n);
	n -= 1;
}


// create a function that returns the string "hello"

helloFun();
// "hello"

function helloFun() {
	return "hello";
}

// Create a function that takes an array of names and returns a new array with "hello [name]" for each name

// sayHello(["Jeff", "Jill"])
// ["Hello Jeff", "Hello Jill"]

name_array(["Jeff", "Jill"]);
// hello [array, of, names, goes, here]

var namebatch = ["Jeff", "Jill"]

function name_array(namebatch) {
	var transformed = [];

	for(var i = 0; i<namebatch.length; i++) {
		transformed.push("Hello " + namebatch[i]);
	}

	return transformed;
}
name_array(namebatch)

