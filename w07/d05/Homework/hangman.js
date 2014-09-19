var word = "noodle";
var wordHash = {};
var incorrectGuesses = 0
var guesses = [];

function declareWordHash (word) {
	for(i=0; i<word.length; i++){
		wordHash[word[i]] = false;
	}
}

declareWordHash(word);


function guessLetter(letter){
	if (alreadyGuessed(letter)) {
		return;
	}

	if (letterInWord(letter)) {
		registerCorrect(letter);
	} else {
		registerIncorrect(letter)
	}

	return checkWon();
}

function alreadyGuessed(letter) {
	return guesses.indexOf(letter);
}

function letterInWord(letter) {
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
	incorrectGuesses++;
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

guessLetter('n')
guessLetter('g')
guessLetter('j')
