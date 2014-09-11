#!/usr/bin/env node

var args = process.argv;
var name1 = args[2]; 
var name2 = args[3];
console.log("hello, " + name1 + " " + name2);


// process.argv => ["node", "filename.js", "arg1", "arg2"]