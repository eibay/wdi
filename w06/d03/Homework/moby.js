#!/usr/local/bin/node 

// get mobyTXT  
var fs = require('fs');
var mobyBuffer = fs.readFileSync("moby.txt"); 
var mobyTXT = mobyBuffer.toString();

// turn str arg into regex 
var regEx = new RegExp(process.argv[2], 'g');

// find matches 
var matchesArray = mobyTXT.match(regEx); 

// count num of matches & output  
console.log(matchesArray.length); 