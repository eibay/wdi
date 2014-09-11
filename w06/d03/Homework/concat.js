#!/usr/local/bin/node 
var fs = require('fs');

var files = []

for(var i = 2; i < process.argv.length; i++){
	var fileName = process.argv[i]
	var fileBuffer = fs.readFileSync(fileName); 
	var fileStr = fileBuffer.toString();
	files.push(fileStr); 
}

// join files w/ newlines & output 
console.log(files.join('\n')); 
