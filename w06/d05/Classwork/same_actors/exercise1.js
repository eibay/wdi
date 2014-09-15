var fs = require('fs');

var titanic = fs.readFileSync("./titanic.txt");
var inception = fs.readFileSync("./inception.txt");

titanic = String(titanic)
inception = String(inception)

var titanic_array = titanic.split(", ");
var inception_array = inception.split(", ");

for (var i = 0; i < titanic_array.length; i++) {
	for (var x = 0; x < inception_array.length; x++) {
		if (titanic_array[i] == inception_array[x]) {
			console.log(titanic_array[i])
		}
	}
};

