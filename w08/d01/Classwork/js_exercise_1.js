// write a function makeArray that takes 2 words as parameters and returns an array of those 2 words

var emptyArray = [];

function makeArray(word1, word2) {
	emptyArray.push(word1, word2)
	return emptyArray
};

console.log(makeArray("red", "blue"));