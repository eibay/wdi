/*Create a function that returns a string with a joke.*/
function makeJoke(){
	return "Feeling to cynical to make a joke."
}
console.log(makeJoke());

/*Create a function that takes a name and returns "hello [name]"*/
function sayName(){
	return "Hello" + name;
};

/*Create a function that takes an array of names and 
console.logs "hello name" for each name*/
var array = ["Tim", "Heidi", "Janine", "Alex"];

function nameArray(names){
	for(var i = 0; i < names.length; i++){
    console.log(names[i]);
  };
};



/*Create a function that takes an array of names and returns 
a new array with "hello [name]" for each name*/
Create a function double that takes a number as an argument and returns it doubled
Create a function quadruple that uses double - ie quadruple(4) === 16
Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name
Create a function that takes two hashes and combines the elements