#!/usr/bin/env node

// var args = process.argv.slice(2);
var readline = require('readline');

// function gets(){
//   console.log = function(d) {
//   var stream = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
//   });
//
//   console.log(stream);
//   // waitpid(10);
//   // process.stdin.read();
//   // process.stdin.on()
//   // process.stdout.write();
//
// }
// };

function test(args){
  var stream = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });
    stream.question("what?", function(ans){
      console.log("meh", ans);

      stream.close();
    });
};
