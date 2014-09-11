var args = process.argv.slice(2);
var i = 0
var array = []
fs = require('fs')
while (i < args.length) { 
	array.push(fs.readFile(args[i])); 
	i +=1
};

console.log(array.join(""))