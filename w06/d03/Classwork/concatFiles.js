var args = process.argv.slice(2);
var i = 0
var array = []
var fs = require('fs')
while (i < args.length) { 
	array.push(fs.readFileSync(args[i])); 
	i +=1
};

console.log(array.join(""))