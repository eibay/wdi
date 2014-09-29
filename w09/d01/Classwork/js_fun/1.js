// 1. Write a function that takes an array of integers and an integer as arguments. The function should return true if the given integer appears in the array, and false if it does not. **do not use [].indexOf**

//   Ie.

//   ```javascript
//   inArray([2,4,5], 4);
//   // true

//   inArray([8,3,4], 7);
//   // false
//   ```

var integers = []

function intArray(obj, int){
	var i;
	for ( i = 0; i < int.length; i++){
		if (int[i] === obj) {
			return true;
		}
	}

	return false;

};
	

console.log(intArray([4,5], 4));


// function containsObject(obj, list) {
//     var i;
//     for (i = 0; i < list.length; i++) {
//         if (list[i] === obj) {
//             return true;
//         }
//     }

//     return false;
// }