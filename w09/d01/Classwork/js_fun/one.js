// 1. Write a function that takes an array of integers and an integer as arguments. The function should return true if the given integer appears in the array, and false if it does not. **do not use [].indexOf**

//   Ie.

//   ```javascript
//   inArray([2,4,5], 4);
//   // true

//   inArray([8,3,4], 7);
//   // false
//   ```

array = [1,3,5,7,9];

function isItHere(num){
	for (i = 0; i < array.length; i++) 
		if (num == array[i]) {
			return true;
		}
		return false;
}

