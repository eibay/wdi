// 1. Write a function that takes an array of integers and an integer as arguments. The function should return true if the given integer appears in the array, and false if it does not. **do not use [].indexOf**

//   Ie.

//   ```javascript
//   inArray([2,4,5], 4);
//   // true

//   inArray([8,3,4], 7);
//   // false
//   ```



function inArray(array, number){
  for (i=0; i < array.length; i++){
    if (array[i] == number){
      return true
    } else if (array[i] != number && i == array.length-1) {
      return false
}
    }
    }

 