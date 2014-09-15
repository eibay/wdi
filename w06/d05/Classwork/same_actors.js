// ###Same Actors

// #### Part 1

//   * Read titanic.txt and inception.txt into your node program.
//   * Convert each movie's actors strings into an array of actors
//   * Compare the arrays, and return all the actors in common.


var fs = require('fs');


var titanic = fs.readFileSync("./same_actors/titanic.txt").toString();
var inception = fs.readFileSync("./same_actors/inception.txt").toString();


var titanic_array = titanic.split(", ");
var inception_array = inception.split(", ");


var matches = []
function common_character(array_a, array_b){
	for (var i =0; i< array_a.length; i ++){
		for (var e = 0; e < array_b.length; e++){
			if (array_a[i] == array_b[e] ) matches.push(array_a[i]);
		}
	} return matches;
};

console.log(common_character(titanic_array, inception_array));
