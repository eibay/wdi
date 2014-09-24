// 1. Mechanics
//   * Create a function that returns a string with a joke.
function joke(){
	console.log("your mom");
}
joke();

//   * Create a function that takes a name and returns "hello [name]"
function greetings(name){
	console.log("hello " + name);
}
greetings(["alice"];

//   * Create a function that takes an array of names and console.logs "hello name" for each name
function greetingsYall(arrayOfNames){
	arrayOfNames.forEach(function(name){
		console.log("hello " + name);
	})
}
greetingsYall(["alice", "bob"]);

//   * Create a function that takes an array of names and returns a new array with "hello [name]" for each name
function greetingsYallArray(arrayOfNames){
	newArray = [];
	arrayOfNames.forEach(function(name){
		newArray.push("hello " + name);
	})
	return newArray;
}
greetingsYallArray(["alice", "bob"]);

//   * Create a function `double` that takes a number as an argument and returns it doubled
function double(number){
	return number*2;
}
double(2);

//   * Create a function `quadruple` that uses `double` - ie `quadruple(4) === 16`
function quadruple(number, duple){
	return duple(duple(number));
}
quadruple(4, double);

//   * Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
newHash = {"alice": "white", "bob": "black", "carol": "red"}



//     * Create a function that takes a hash of favorite colors and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
function whichColour(hashOfColours){
	var names = Object.keys(hashOfColours)
	for(i=0; i<names.length; i++){
		console.log(names[i] + "'s favourite colour is " + hashOfColours[names[i]]);
	}
}
newHash = {"alice": "white", "bob": "black", "carol": "red"}
whichColour(newHash)


//   * Create a function that takes two hashes and combines the elements
function combineHash(hash1, hash2){
	for (key in hash1){
		hash2[key] = hash1[key];
	}
	return hash2;
}

newHash = {"alice": "white", "bob": "black", "carol": "red"}
keepHash = {"gastropod": 0, "cephalopod": 1}
combineHash(newHash, keepHash);




