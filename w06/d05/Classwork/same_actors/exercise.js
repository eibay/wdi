// var fs = require('fs');

// var titanic = fs.readFileSync("./titanic.txt", "utf8");

// var inception = fs.readFileSync("./inception.txt", "utf8");

// var titanic_arr = titanic.split(", ");

// var inception_arr = inception.split(", ");

// debugger

// for (var i = 0; i < titanic_arr.length; i++) {
// 	if (titanic_arr[i] == inception_arr[inception_arr.indexOf(titanic_arr[i])]) {
// 		console.log(titanic_arr[i])
// 	}
// }

var fs = require('fs');

var titanic = fs.readFileSync("./titanic.txt", "utf8").trim;

var inception = fs.readFileSync("./inception.txt", "utf8").trim;

titanic.forEach(function(name) {
	if inception.indexOf(name) != -1 {
		console.log(name);
	}
})