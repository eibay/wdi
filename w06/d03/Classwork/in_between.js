#!/usr/bin/env node


var args = process.argv;
var num1 = args[2];
var num2 = args[3];


var n1 = parseInt(num1) ;
var n2 = parseInt(num2) ;


while (n1 < (n2-1) ) {
	console.log(n1 + 1); 
 n1+=1;
};


