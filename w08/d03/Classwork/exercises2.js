// Create a function that returns a string with a joke.
function joke() {
	return "im fucking with you guys!"
};
console.log(joke());

// Create a function that takes a name and returns "hello [name]"
function myname(name) {
	return "Hello " + name + "!"
};
myname("Jeff");

// Create a function that takes an array of names and console.logs "hello name" for each name
var name_array =["Jeff", "Ray", "Christian"]

function names(array_name) {
	for(i = 0; i < array_name.length; i++) {
		console.log("Hello " + array_name[i]);
	};
};

names(["Jeff", "Ray", "Christian"]);

// Create a function that takes an array of names and returns a new array with "hello [name]" for each name
var name_array =["Jeff", "Ray", "Christian"]

function names(array_name) {
	var emptyArray = []
	for(i = 0; i < array_name.length; i++) {
		emptyArray.push("Hello " + array_name[i]);
	};
	return emptyArray;
};

names(["Jeff", "Ray", "Christian"]);

// Create a function double that takes a number as an argument and returns it doubled
function double(number) {
	return number * 2
};
double("2");

// Create a function quadruple that uses double - ie quadruple(4) === 16
function double(number) {
	return number * 2
};

function quadruple(number) {
	return (double(number)) + (double(number))
};

quadruple("2");

// Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
// Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name

var hashPeople = {
	"jeff": "blue",
	"ray": "black",
	"mike": "red"
};
// hashPeople

function favoriteColors(people) {
	var valuesArray = Object.keys(people);

	for(i = 0; i < valuesArray.length; i++){
		console.log(valuesArray[i] + "'s favorite color is " + people[valuesArray[i]]);
	};
};
favoriteColors(hashPeople);
