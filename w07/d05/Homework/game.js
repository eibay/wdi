var word = "hodor"
var wordHash  = {}
var wrongGuesses = 0

var guesses = []

console.log("Word length: " + word.length)


function declareWordHash (word) {
	for(i=0; i<word.length; i++){

		wordHash[word[i]] = false;
	}
}

declareWordHash(word)

function guessLetter(letter){
	if (alreadyGuessed(letter)) {
		return;
	}

	if (isLetterInWord(letter)) {
		registerCorrect(letter);
	} else {
		registerIncorrect(letter)
	}

	return checkWon();
}

function alreadyGuessed(letter) {
	return guesses.indexOf(letter) != -1 || guesses.indexOf(letter) != -1;
}

function isLetterInWord(letter) {
	for(i=0; i<word.length; i++) {	
		if ( word.indexOf(letter) != -1) {
			return true;
		}
	}

	return false;
}

function registerCorrect(letter) {
	wordHash[letter] = true;
	guesses.push(letter);
}

function registerIncorrect(letter) {
	guesses.push(letter);
	wrongGuesses--;
}

function checkWon() {
	allTrue = true;

	for (key in wordHash) {
		if (wordHash[key] == false) {
			allTrue = false;
		}
	}

	return allTrue;
}

function checkLost() {
	if (wrongGuesses == 0) {
		return true;
	}
}