#! /usr/local/bin/node

var fs = require("fs");

args = process.argv;

var all = args.length;

var index = 2;

var text = ""

var output = "";

while (index < all) {
	text = fs.readFileSync(args[index]).toString() + "\n";
	output = output + text;
	index = index + 1;
};

console.log(output);