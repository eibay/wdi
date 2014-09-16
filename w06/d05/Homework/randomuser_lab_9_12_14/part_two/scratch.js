var redis = require("redis");

process.stdin.setEncoding('utf8');

console.log("Please enter your name.");

process.stdin.on("readable", function() {
  var name = process.stdin.read();
  if (name != null) {
  	name = name.replace("\n", "");
  	console.log("Hello, " + name + ".");
  	process.end();
  }
 });

process.stdin.on("end", function() {
	console.log("Enter your city and state of residence, please.");
})



