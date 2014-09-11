#!/usr/bin/env node

// this is the thing you put in terminal to turn your file into an app
// chmod u+x in_between.js

var args = process.argv;
// argv is an array of everything you type in
var num1 = args[2];
var num2 = args[3];


var n1 = parseInt(num1) ;
var n2 = parseInt(num2) ;


while (n1 < (n2-1) ) {
	console.log(n1 + 1); 
	n1+=1;
};


// for function inBetween:

// 	inBetween(parseInt(args[2]),parseInt(args[3]));