window.addEventListener('load', function () {
	
})

function checkForLetter(letter, word) {
	var indexes = [];
	for (var i = 0; i < word.length; i++) {
		if (letter == word[i]) 
			indexes.push(i); 
		}
	return indexes; 
}