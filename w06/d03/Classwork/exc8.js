
function filterLongWords(num, words) {
	var arrayOfWords = [];
	var i = 0;

	while (i < words.length) {
		if ((words[i].length) > num) {
			arrayOfWords.push(words[i]);
		}
		i += 1;
	}
	return arrayOfWords;
}


console.log(filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"]));

// words = ["hello", "hi", "hey", "hola", "aloha"];