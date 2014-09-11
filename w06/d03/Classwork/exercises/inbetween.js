#! /usr/local/bin/node



function inBetween(int1, int2) {
	increment = int1 + 1;
	arr = [];
	while (increment < int2) {
		arr.push(increment);
		increment = increment + 1
	} return arr.join("\n")	 
};
var args = process.argv;

var num1 = parseInt(args[2]);
var num2 = parseInt(args[3]);

ans = inBetween(num1, num2);
console.log(ans);
