// 1. Mechanics
//   * Create a function that returns a string with a joke.
//   * Create a function that takes a name and returns "hello [name]"
//   * Create a function that takes an array of names and console.logs "hello name" for each name
//   * Create a function that takes an array of names and returns a new array with "hello [name]" for each name
//   * Create a function `double` that takes a number as an argument and returns it doubled
//   * Create a function `quadruple` that uses `double` - ie `quadruple(4) === 16`
//   * Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
//     * Create a function that takes the above hash and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
//   * Create a function that takes two hashes and combines the elements

function joke() {
	return "this is funny, ha ha";
}
////////////////
function greeting(name) {
	return "Hello " + name;
}

////////////////
function greetings(namesArray) {
	for (var i = 0; i < namesArray.length; i++) {
		console.log("Hello " +  namesArray[i]);
	}
}

greetings(["Amy", "Jill", "Collin"]);

////////////////

function greetings(namesArray) {
	newArray = [];
	for (var i = 0; i < namesArray.length; i++) {
		newArray.push("Hello " + namesArray[i] + "!");
	}
	return newArray
}

greetings(["Amy", "Jill", "Collin"]);

////////////////

function hello(name){
	console.log("Hello " + name);
}

things = ["Amy", "Jill", "Collin"];

array.forEach(hello);
["Amy", "Jill", "Collin"].forEach(hello);


////////////////
function double(num) {
	return num * 2;
}

function quad(num) {
	return double(num) * 2;
}

////////////////

hash = {"jill."}








