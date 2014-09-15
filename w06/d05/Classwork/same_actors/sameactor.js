var fs = require('fs');

var actors = fs.readFileSync("./inception.txt")
var actors2 = fs.readFileSync("./titanic.txt")

var actors_string = actors.toString()
var actors2_string = actors2.toString()

var actors_array = actors_string.split(', ');
var actors2_array = actors2_string.split(', ');

	console.log(actors_array)
	console.log(actors2_array)