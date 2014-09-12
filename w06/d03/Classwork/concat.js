#!/usr/bin/env node

var args = process.argv.slice(2);


function concat(array_of_words){
	no_spaces = array_of_words.join("");
	return no_spaces
}


console.log(concat(args))
