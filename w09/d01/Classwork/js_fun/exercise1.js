// 1. Write a function that takes an array of integers and an integer as arguments. The function should return true if the given integer appears in the array, and false if it does not. **do not use [].indexOf**

//   Ie.

//   ```javascript
//   inArray([2,4,5], 4);
//   // true

//   inArray([8,3,4], 7);
//   // false
//   ```


var arrayOfIntegers = function(array,integer){
	for(var i = 0; i<array.length; i++){
		if(parseInt(array)[i].contains(parseInt(integer)){
				console.log("true");
		}
};
arrayOfIntegers([4,5,6], 6);

