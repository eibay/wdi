#!/usr/local/bin/node
var args=process.argv
console.log(args[2])


var fs = require('fs');
var file = fs.readFileSync('./dick.txt');
var dick=file.toString()
if(dick.match(new RegExp( "\\b" + args[2] + "\\b", "gi"))){

	console.log(dick.match(new RegExp( "\\b" + args[2] + "\\b", "gi")).length)

}
else
{
	console.log("no matches for that word in moby dick")
}
