function inbetween(num1, num2){
  var start = num1
  var end = num2
  var go = start + 1
  var index = start
  while (index < (end - 1)){
      console.log(go++)
      index++
  }
};

inbetween(4, 16)
