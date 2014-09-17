#!/usr/local/bin/node 

const fs = require('fs');
const opt = process.argv[2];
const amount = Number(process.argv[3]);
var accountFile = "bank.account"; 

function manipulateAccount(af, a, fn) {
	fs.readFile(af, 'utf-8', function(e, f) {
		if (e) {
			console.error(e); 
		} else {
			var account = Number(f);
			account = fn(account, a); 
			console.log("You now have $" + account + " in your account!");
			fs.writeFile(af, account, 'utf-8', function(e) {
				if (e) console.error(e); 
			})  
		} 
	})
}

function sub(a, b) {
	return a - b 
}

function add(a, b) {
	return a + b 
}


if (opt == "deposit") {
	console.log("You wanna deposit $" + amount + '!'); 
	manipulateAccount(accountFile, amount, add); 

} else if (opt == "withdraw") {
	console.log("You wanna withdraw $" + amount + '!');
	manipulateAccount(accountFile, amount, sub); 

} else {
	console.error("Unrecognized option " + opt + '!'); 
}