#! /usr/local/bin/node

// function log(str) { process.stdout.write(str + "\n"); }log("shmee");

var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout
})

answers = {}

rl.question("What is your name?", function(answer) {
	answers["name"] = answer;
	console.log("So nice to meet you " + answers["name"]);
	rl.question("How old are you?", function(answer) {
		answers["age"] = answer;
		console.log(answer + " years young!");
			rl.question("What's your favorite food?", function(answer) {
				answers["food"] = answer;
				console.log("Yum! I love " + answer);
				console.log("Let me recap: You are " + answers["name"] + ", " + answers["age"] + " years old, who loves " + answers["food"]);
				rl.close();
			})
	})	
});