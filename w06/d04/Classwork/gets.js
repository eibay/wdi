#!/usr/local/bin/node 

function gets(what, callback) {
	// initialize stdin reading process 
	process.stdin.resume(); 
	// log the contents of what along w/ a newline 
	console.log(what + '\n'); 

	// listen for a 'data' event in stdin,  
	// perform the hereunder callback & 
	// detach the listener from stdin 
	process.stdin.once('data', function(data) {
		// this callback 
		// stores the data as a string inside str 
		str = data.toString();
		// & performs the callback  
		// passed to gets(), passing it str 
		callback(str); 
	}); 
}

gets("What is your age?", function(age) {
	// wait until you get age then 
	gets("What is your name?", function(name) {
		// wait until you get name then 
		gets("What is kind of computer do you have?", function(computer) {
			// wait until you get computer then 
			console.log(''); // log a newline 
			console.log("Your age is: ", age); // log a description of name 
			console.log("Your name is: ", name); // etc 
			console.log("You computer is a: ", computer); // etc
			process.exit(); // terminate script 
		}); 
    });
}); 
