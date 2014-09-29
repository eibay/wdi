function inArray(array, int) {
	for(i = 0; i < array.length; i++) {
		if (array[i] == int) {
			return true
		}
	}
	return false
}

console.log(inArray([2,4,5], 4));
console.log(inArray([8,3,4], 7));