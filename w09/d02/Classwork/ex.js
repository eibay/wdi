// function one(x) {
//   console.log(x);
// }

// for(var i = 0; i < 100; i++) {
//   one(i + 1);
// }


// function num(x) {
//   return(x + 1);
// }

// for(var i = 0; i <= 100; i++) {
//   console.log(num(i + 4));
// }

// Above functions both do the same thing in diff ways.

// for(var i = 100; i > 0; i--) {
//   console.log(i);
// }

// function add(x, y) {
//   return(x + y)
// }

// console.log(add(5, 10));

function max(x, y) {
  if(x > y) {
    return x;
  } else
    return y;
}

function bigMax(a, b, c) {
    return max(max(a, b), c)
  }
console.log(bigMax(1, 2, 3))
console.log(bigMax(5, 8, 11))
console.log(bigMax(6, 20, 11))


// maxab is values a and b which r 1 and 2
// maxabc is values c which is 3.



