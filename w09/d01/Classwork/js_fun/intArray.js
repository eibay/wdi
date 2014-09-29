function includeNum(array, num) {
	for (i=0; i<array.length; i++) {
		if(array[i] == num) {
			console.log(true);
			break
		}
	}
}

includeNum([5, 3, 4, 5], 5)