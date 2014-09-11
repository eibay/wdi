#!/usr/local/bin/node

var to = process.argv[2];

var from = process.argv[3];

function inBetween(h, t){
	h++;
	while(h < t){
		console.log(h); 
		h++; 
	}
}

inBetween(to, from); 