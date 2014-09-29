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


//   * Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
//   * Create a function that takes the above hash and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
// What the fuck? does javascript have hashes? or object literals?

foo = {};

var thing = {"jill": "purple", "amy": "blue", "sam": "green"}
var color = {jill: "purple", amy: "blue", sam: "green"}

color["judy"] = "red";
color["steven"] = "blue";

// examples
color.jill
"purple"

console.log(Object.keys(color));
["jill", "amy", "sam"] 

function faveColor() {
	color.forEach()
}

function phrase()

Object.keys(color) + " favorite color is " + name.color
// "[name] favorite color is [color]" for each name

	for (var i = 0; i < namesArray.length; i++) {
		newArray.push("Hello " + namesArray[i] + "!");
	}


////////////////

var color = {jill: "purple", amy: "blue", sam: "green"};

things = ["Amy", "Jill", "Collin"];

// Object.keys(color) + " favorite color is " + name.color
// "[name] favorite color is [color]" for each name


// array.forEach(hello);

Object.keys({jill: "purple", amy: "blue", sam: "green"})


/////neils answer

var people = {
	"Neel": "Orange",
	"Sean": "Blue",
	"Jeff": "Red"
};

function colors(hashOfPeople){
	var keysArray = Object.keys(hashOfPeople);

	for(var i = 0; i < keysArray.length; i++){
		console.log(keysArray[i] + "'s favorite color is " + hashOfPeople[keysArray[i]]);
	};
};

colors(people);


















