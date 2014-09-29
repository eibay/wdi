function inArray(arrInt, num){
  for(var i=0;i<arrInt.length;i++){
    if (num == arrInt[i]){
      return true
    }

  }
  return false
}

console.log(inArray([2,3,4], 4));
console.log(inArray([2,3,4], 9));
