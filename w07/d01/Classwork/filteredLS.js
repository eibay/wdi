var fs = require("fs");

var dir = process.argv[2];

var filetype = process.argv[3];

fs.readdir(dir, function(err, list){
	if (err) {
		console.log(err);
	}
	var files = [];
	list.forEach(function(file){
		if (file.split(".")[1] == filetype) {
			files.push(file);
		}
	})
	files.forEach(function(file) {
		console.log(file)
	})
})
