var fs = require('fs');

var titanic = fs.readFileSync('./titantic.txt').toString();
var inception = fs.readFileSync('./inception.txt').toString();

var titanic_actors = titanic.split(', ');
var inception_actors = inception.split(', ');

same = [];

var i = 0;

for (var i = 0; i < titanic_actors.length; i++) {
	actor = titanic_actors[i];

	
}
	