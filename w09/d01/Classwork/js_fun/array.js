function inArray (arr, num) {
	var x = 0
	for (var i=0; i<arr.length; i++) {
		if (num == arr[i]) {
			x++
		}	
	}
	if (x > 0) {
		return true
	} else
	return false
}

console.log(inArray([2,4,5], 4))
// true

console.log(inArray([8,3,4], 7))
// false