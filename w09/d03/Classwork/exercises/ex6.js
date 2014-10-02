// Make a quadruple function that uses a double function and than ouputs quadruple of it.

function double(x) {

  return x * 2

}

function quadruple(y) {

  var quad = double(y) + double(y)

  return quad;

}

var answer = quadruple(4);
console.log(answer)