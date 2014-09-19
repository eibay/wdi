var word = document.getElementsByClassName("guessed-letters")
var wordHash  = {}
var wrongGuesses = 8

var guesses = []

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
	progressHash[letter] = true;
	guesses.push(letter);
}

function registerIncorrect(letter) {
	guesses.push(letter);
	wrongGuesses--;
}

function checkWon() {
	allTrue = true;

	for (key in progressHash) {
		if (progressHash[key] == false) {
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