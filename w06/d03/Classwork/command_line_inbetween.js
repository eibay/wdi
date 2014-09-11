#! /usr/local/bin/node
var args = process.argv;

function inbetween(num1, num2) {
	for (i = num1 + 1; i < num2; i++) {
		console.log(i);
	}
}

inbetween(parseInt(args[2]), parseInt(args[3]));