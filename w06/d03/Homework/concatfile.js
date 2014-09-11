#!/usr/bin/env node
var args = process.argv.slice(2);
var fs = require("fs");

files = []

var file1 = fs.readFile(args[0], function(err, data){
  if (err) throw err;
   files.push(data.toString());
  //  console.log(files);
});

var file2 = fs.readFile(args[1], function(err,data){
  if (err) throw err;
   files.push(data.toString());
   console.log(files.join(""));
})
