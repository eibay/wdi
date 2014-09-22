// write a function makeArray that takes 2 words as parameters and returns an array of those 2 words

function makeArray(word1, word2) {
	array = [word1, word2];
	return array;
	console.log(array);
};

makeArray("dog", "cat");
//doesn't work (dog is not defined)

function makeArray(word1, word2) {
	array = [];
	array.push(word1);
	array.push(word2);
	return array;
	console.log(array);
}

makeArray("dog", "cat");
//doesn't work (dog is not defined)
