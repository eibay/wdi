// Write a command line app that takes 2 numbers and prints every number in between 2-6

//#!/usr/bin/env node
var args = process.argv;
// $ node filename.js 2 10
// process.argv => ["node", "filename.js", "arg1", "arg2"]

function inBetween(num1, num2) {
	while (num1 < (num2-1)) {
	console.log(num1+1)
	num1 += 1
};
}

console.log(inBetween(parseInt(args[2]), parseInt(args[3])));