var fs = require("fs");

var path = process.argv[2];

var text = fs.readFileSync(path, "UTF8");

var splitArray = text.split("\n");

var output = splitArray.length - 1;

console.log(output);

