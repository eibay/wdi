var redis = require("redis");

process.stdin.setEncoding('utf8');

console.log("Please enter your name.");

process.stdin.on("readable", function() {
  var name = process.stdin.read();
  }
});


console.log(name);
