var fs = require('fs');

var inception_raw = fs.readFileSync('./inception.txt');
var titanic_raw = fs.readFileSync('./titanic.txt');
var inception = String(inception_raw);
var titanic = String(titanic_raw);
var inception_array = inception.split(', ');
var titanic_array = titanic.split(', ');

var compare = function(array1, array2) {
	for ( var i = 0; i < array1.length; i++ ) {
		for ( var x = 0; x < array2.length; x++) {
			if ( array1[i] == array2[x] ) {
				console.log(array1[i])
			}
		}

	}

}

compare(inception_array, titanic_array);

debugger


