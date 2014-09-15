// ###Same Actors

// #### Part 1

//   * Read titanic.txt and inception.txt into your node program.
//   * Convert each movie's actors strings into an array of actors
//   * Compare the arrays, and return all the actors in common.

var fs = require("fs")
var inception= fs.readFileSync("./inception.txt").toString();
var titanic= fs.readFileSync("./titanic.txt").toString();

var inception_cast = inception.split(", ");
var titanic_cast = titanic.split(", ");

// console.log(inception_cast + titanic_cast);

var similar = function(inception_actors, titanic_actors) {
	var common_actor = []
	inception_actors.forEach (function(x) {
	titanic_actors.forEach (function(y) {
		if(x == y) {
		common_actor.push(x){
		}
		})
		})
		console.log(common_actor);
	}
similar(inception_cast, titanic_cast);