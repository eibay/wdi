// process.stdin.resume();
//   process.stdin.setEncoding('utf8');
//   var util = require('util');

//   process.stdin.on('data', function (text) {
//     console.log('received data:', util.inspect(text));
//     if (text === 'quit\n') {
//       done();
//     }
//   });

//   function done() {
//     console.log('Now that process.stdin is paused, there is nothing more to do.');
//     process.exit();
//   }

//   console.log('received data:')




// var sys = require("sys");

// var stdin = process.openStdin();

// stdin.addListener("data", function(d) {
//     // note:  d is an object, and when converted to a string it will
//     // end with a linefeed.  so we (rather crudely) account for that  
//     // with toString() and then substring() 
//     console.log("you entered: [" + 
//         d.toString().substring(0, d.length-1) + "]");
//   });


//   function log(str) { process.stdout.write(str + "\n"); }log("shmee");







// process.stdin.setEncoding('utf8');

// process.stdin.on('readable', function() {
//   var chunk = process.stdin.read();
//   if (chunk !== null) {
//     process.stdout.write('data: ' + chunk);
//   }
// });

// process.stdin.on('end', function() {
//   process.stdout.write('end');
// });







var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("What do you think of node.js? ", function(answer) {
  rl.question("why do you think of node.js ", function(answer2) {



  console.log("Thank you for your valuable feedback:", answer, answer2);

  rl.close();
});});




