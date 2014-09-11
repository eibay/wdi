//  process.stdin.resume();
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




//   process.stdin.setEncoding('utf8');

// process.stdin.on('readable', function() {
//   var chunk = process.stdin.read();
//   if (chunk !== null) {
//     process.stdout.write('data: ' + chunk);
//   }
// });

// process.stdin.on('end', function() {
//   process.stdout.write('end');
// });


process.stdin.setEncoding('utf8');

console.log("Please enter your name.");

process.stdin.on("readable", function() {
  var name = process.stdin.read();
  if (name != null) {
    process.exit;
  };
});


console.log(name);

