#!/usr/bin/env node

var number_array= []


function inbetween(first, last){
	while (first<last){
	number_array.push(first);
	first += 1;
	} return number_array
};

var args = process.argv;
console.log(inbetween(parseInt(args[2]), parseInt(args[3])));