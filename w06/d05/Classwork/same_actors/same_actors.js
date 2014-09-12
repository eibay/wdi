// Part 1

// Read titanic.txt and inception.txt into your node program.
// Convert each movie's actors strings into an array of actors
// Compare the arrays, and return all the actors in common.

var fs = require ('fs');

var titanicTxt = fs.readFileSync("./titanic.txt");
var titanicCast = titanicTxt.toString();
var titanicArray = titanicCast.split(', ');

var inceptionTxt = fs.readFileSync("./inception.txt");
var inceptionCast = inceptionTxt.toString();
var inceptionArray = inceptionCast.split(', ');

function evaluate(array1, array2)

var similar = []

	array1.forEach(function (actor1) { 
	array2.forEach(function (actor2) {
		if (actor1 == actor2) {
		similar.push(actor1);
		console.log(similar);
		};
	});
});

	// inceptionArray.forEach(function(actor) {
	// 	titanicArray.forEach(function(other_actor) {
	// 		if (actor == other_actor) {
	// 			similar.push(actor);
	// 		};
	// 	});
	// });

evaluate(inceptionArray, titanicArray)