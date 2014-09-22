#!/usr/local/bin/node 

// get mobyTXT  
var fs = require('fs');
var mobyBuffer = fs.readFileSync("moby.txt"); 
var mobyTXT = mobyBuffer.toString();

var regEx = new RegExp(process.argv[2], 'g');

var matchesArray = mobyTXT.match(regEx); 

// count num of matches & output 
console.log(matchesArray.length); 