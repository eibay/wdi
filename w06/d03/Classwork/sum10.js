function sum10(num1, num2) {
  var sum = num1 + num2;
  if (num1 == 10 || num2 == 10 || sum == 10){
    console.log(true)
  } else {
    console.log(false)
  }

};

 sum10(9, 10)
  // true
  sum10(9, 9)
  // false
  sum10(1, 9)
  // true
