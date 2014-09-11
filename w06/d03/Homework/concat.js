#!/usr/bin/env node
var args = process.argv.slice(2);

function concat(args){
  console.log(args.join(""));
};

concat(args);
