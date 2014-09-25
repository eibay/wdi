/*Create a function that takes an array of 
names and returns a new array with "hello [name]" for each name*/

names = ["Tim", "Janine", "Alex"]

function outputNames(array) {
	for (i = 0; i < names.length; i++) {
		console.log("Hello" + array[i]);
	};
};
outputNames(names);