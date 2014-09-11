#!/usr/local/bin/node
var args=process.argv
console.log(args[2])


var fs = require('fs');
var file = fs.readFileSync('./dick.txt');
var dick=file.toString()

console.log(dick.match(new RegExp( "\\b" + args[2] + "\\b", "gi")).length)

