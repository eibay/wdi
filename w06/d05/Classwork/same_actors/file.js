var fs = require("fs");

titanic_arr = fs.readFileSync("./titanic.txt", "UTF8").split(", ");
inception_arr = fs.readFileSync("./inception.txt", "UTF8").split(", ");

var compareArrays = function(array1, array2) {
	var in_common = []
	for (i = 0; i < array1.length; i++) {
		for (j = 0; j < array2.length; j++) {
			if (array1[i] == array2[j]) {
				in_common.push(array1[i]);
	}}}
	return in_common;
}

