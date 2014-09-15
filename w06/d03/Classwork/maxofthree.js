
// 6. Define a function `maxOfThree` that takes three numbers as arguments and returns the largest of them

//   ```javascript
//   maxOfThree(1, 4, 6)
//   // 6
//   ```



var maxOfThree = function(x,y,z){
	  if (x > y && x > z){
		return x;
	} else if (y > x && y > z){
		return y;
	} else if (z > x && z > y){
		return z;
	};
	
};

console.log(maxOfThree(1,4,6));
console.log(maxOfThree(5,77,3));