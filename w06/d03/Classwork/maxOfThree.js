function maxOfThree(num1, num2, num3){
  var max = 0
  var index = 0
  while (index < 3){
    if (num1 > max){
      max = num1;
    } else if (num2 > max){
      max = num2;
    } else if (num3 > max){
      max = num3;
    }
    index ++
  }
  console.log(max);
};

maxOfThree(1, 7, 6)
