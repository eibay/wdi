#!/usr/bin/env node
// var fs = require('fs');
var args = process.argv.slice(2);
debugger 
function concat_file(files){
	var words = fs.readFileSync(files[0])
	var no_spaces = words.join("");
	return no_spaces
}

console.log(concat_file(args));