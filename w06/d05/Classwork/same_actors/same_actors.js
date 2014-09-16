var fs = require('fs');

var inception = fs.readFileSync('inception.txt');
var titanic = fs.readFileSync('titanic.txt');

inception = inception.toString();
titanic = titanic.toString();

var inception_actors = inception.split(', ');
var titanic_actors = titanic.split(', ');

var similar = [];

// for (var i = 0; i < titanic_actors.length; i++) {
// 	var actor = titanic_actors[i]
// 	for (var j = 0; j < inception_actors.length; j++){
// 		var other_actor = inception_actors[j];
// 		if (actor == other_actor) {
// 			similar.push(actor);
// 		};
// 	};
// };

inception_actors.forEach(function(actor) {
	if (titanic_actors.indexOf(actor) != -1) {
		similar.push(actor)
	};
});

console.log(similar);