var args = process.argv
var fs = require('fs')
var txt = fs.readFileSync('./moby.txt');
var moby = String(txt)
var count = moby.split(" " + args[2] + " ").length-1

console.log(count)