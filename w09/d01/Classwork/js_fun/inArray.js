function inArray (arr, int) {
var i = 0
	while (i < arr.length) {
		if (arr[i] == int) {
			return true;
		} else {
			return false;
			i++
		}
	};
}


console.log(inArray([2,4,5], 4));
// true

console.log(inArray([8,3,4], 7));
// false