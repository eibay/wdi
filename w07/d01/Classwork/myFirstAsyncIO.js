var fs = require("fs");

var path = process.argv[2];

var holder = []

fs.readFile(path, "UTF8", function(err, data) {
		var splitArray = data.split("\n");
		var output = splitArray.length - 1;
		console.log(output);
})
