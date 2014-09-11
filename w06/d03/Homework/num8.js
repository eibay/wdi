function filterLongWords(int, arr) {
	list = []
	for (var i=0; i < arr.length; i++){
		if (arr[i].length > int) {
			list.push(arr[i]);
		}
	}
			console.log(list)
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])