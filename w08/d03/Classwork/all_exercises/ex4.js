function doubleMe(num){
  num = process.argv;
  num = num.splice(2);
  return num * 2
}


console.log(doubleMe());
