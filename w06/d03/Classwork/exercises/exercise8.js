function filterLongWords(min, arr) {
	var inc = 0;
	words = [];
	while (inc < arr.length) {
		if (arr[inc].length > min) {
			words.push(arr[inc])
		}
		inc = inc + 1
	}
	return words
}

ans = filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
console.log(ans)