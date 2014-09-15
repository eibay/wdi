function makes10(num1, num2) {

var sum = num1 + num2;

  if (sum == 10) {

    return true

  } else if ( num1 == 10 || num2 == 10 ) {

      return true

  } else {

      return false

  };

};

console.log(makes10(9, 10))

console.log(makes10(9, 9))

console.log(makes10(1, 9))







