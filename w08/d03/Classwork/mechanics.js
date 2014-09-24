// 1. Mechanics
//   * Create a function that returns a string with a joke.
//   * Create a function that takes a name and returns "hello [name]"
//   * Create a function that takes an array of names and console.logs "hello name" for each name
//   * Create a function that takes an array of names and returns a new array with "hello [name]" for each name
//   * Create a function `double` that takes a number as an argument and returns it doubled
//   * Create a function `quadruple` that uses `double` - ie `quadruple(4) === 16`
//   * Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
//     * Create a function that takes a hash of favorite colors and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
//   * Create a function that takes two hashes and combines the elements


var joke = function(string){
	return ("What do you call an alligator in a vest?")
	return ("An investigator")
};
console.log(joke("tell me a joke"));


// ########################

var name = function(name){
	return ("Hello"+ " "+ name);
};

console.log(name("Sean"))

// ########################


var names = function(array){
	var names = []
	for(var i=0; i < array.length; i++){
		names.push("Hello"+ " " + array[i]);
	} return names
};
console.log(names(["Tess", "Iris"]))


// ########################


var arrayOfNames = function(array){
	var arrayOfHelloNames = []
	for(var i=0; i < array.length; i++){
		arrayOfHelloNames.push("Hello" + " " + array[i])
	}	return arrayOfHelloNames
};

console.log(arrayOfNames(["Neel", "Jeff"]))


// ########################

var double = function(integer){
	var x = parseInt(integer) * 2
	return x
}
console.log(double("4"));


// ########################


var quadruple = function(integer){
	var x = parseInt(integer)
	var y = double(x)
	var z = double(y)
	return z
}
console.log(quadruple("4"));

// ########################

favoriteColors = {"Tess": " pink", "Iris": "Aqua", "Nastasia": "Blue"}
console.log(favoriteColors);

// ########################

var favoriteColorsFunction = function(hash){
	x = Object.keys({"Tess": " Pink", "Iris": "Aqua", "Nastasia": "Blue"})
	return x
} 

for(var i = 0; i < keys.length; i++){

}

