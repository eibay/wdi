// var doubleMe = require("./ex4.js");

function doubleMe(num){

  return num * 2
}

function quadruple(){
  num = process.argv;
  num = num.splice(2);
  return (doubleMe(num) * doubleMe(num));
}

console.log(quadruple());
