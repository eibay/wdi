// 1
function inArray(array, integer){
	for (var i = 0; i < array.length; i++) {
		if (array[i] == integer) {
			return true
		}
	}
	return false;
}

console.log(inArray([2,4,5], 4));
  // true
console.log(inArray([8,3,4], 7));
  // false