#!/usr/local/bin/node 

function gets(what, callback) {
	process.stdin.resume(); 
	console.log(what + '\n'); 

	process.stdin.once('data', function(data) {
		str = data.toString();
		callback(str); 
	}); 
}

gets("What is your age?", function(name) {
	gets("What is your name?", function(email) {
		gets("What is kind of computer do you have?", function(computer) {
			console.log('');
			console.log("Your age is: ", name);
			console.log("Your name is: ", email);
			console.log("You computer is a: ", computer); 
			process.exit();
		}); 
    });
}); 
