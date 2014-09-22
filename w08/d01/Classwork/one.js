function makeArray(word1, word2) {
	var arrayOfWords = [];
	arrayOfWords.push(word1);
	arrayOfWords.push(word2);
	return arrayOfWords;
}

function howbig(word) {
	if word.length < 3 {
		return "small";
	else if word.length >= 3 && word.length <= 5
		return "medium";
	else
		return "big";
	}
}

function stringInfo(word) {
	var hash = {
		length: word.length,
		

	}


}







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

words = ["hello", "hi", "hey", "hola", "aloha"];