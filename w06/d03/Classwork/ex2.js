function posNeg(num1, num2, bool) {
    if (bool == true){
      if (num1 < 0 && num2 < 0) {
        console.log(true);
      }
      else {
        console.log(false);
      };
    else {
      if (num1 > 0 || num2 > 0) {
        console.log(true);
      } else {
        console.log(false);
      };
    };
  };
};

  posNeg(1, -1, false)
  posNeg(1, 1, false)
  posNeg(1, 1, true)
  posNeg(-3, -1, true)
