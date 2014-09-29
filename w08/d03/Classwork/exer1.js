// Mechanics
// Create a function that returns a string with a joke.


function joke() {
	return "a guy walks into a bar";
}

console.log(joke());

// Create a function that takes a name and returns "hello [name]"

function hello(name) {
	return "hello " + name;
}

hello("lisa");

console.log(hello("brenda"));

// Create a function that takes an array of names and console.logs "hello name" for each name

array = ["jeff1", "jeff2", "jill", "brenda"];

function helloAll(array) {
	for (var i = 0; i < array.length; i++) {
		console.log("hello " + array[i]);
	}
}

helloAll(array);

///////////////////

function helloEach(name) {
		console.log("hello " + name);
	};

array.forEach(helloEach);

///////
// Create a function that takes an array of names and returns a new array with "hello [name]" for each name

array = ["jeff1", "jeff2", "jill", "brenda"];

function helloArray(arr) {
	newArray = [];
	for (var n = 0; n < arr.length; n++) {
		newArray.push("hello " + arr[n]); 
	} return newArray;
};

helloArray(array);

//////////

// Create a function double that takes a number as an argument and returns it doubled

function double(num) {
	return num * 2
};

/////////

// Create a function quadruple that uses double - ie quadruple(4) === 16

function quadruple(n) {
	// var dbl = double(n);
	// return dbl * 2; 
	return double(double(n));
}

quadruple(5);

////////
// Create a function that takes the hash and 
// uses Object.keys to print out "[name] favorite color is [color]" for each name

nc_hash = {lisa: "teal", david: "brown", brenda: "blue"};

function nameColor(hash) {
	keys = Object.keys(hash);
	for (var i = 0; i < keys.length; i++) {
		if (keys[i] == hash[keys[i]]);
		console.log(keys[i] + "'s favorite color is " + hash[keys[i]]);
	}
	
}

nameColor(nc_hash);

// Create a function that takes two hashes and combines the elements





