function declareProgressHash (word) {
	for(i=0; i<word.length; i++){
		//no need to worry about dupicates cuz hash keys get overwritten
		progressHash[word[i]] = false;
	}
}

declareProgressHash(word)
console.log(progressHash)


//we type this in console, right now, later change.
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
	return wrongLetters.indexOf(letter) != -1 || rightLetters.indexOf(letter) != -1;
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
	progressHash[letter] = true;
	rightLetters.push(letter);
}

function registerIncorrect(letter) {
	wrongLetters.push(letter);
	wrongGuesses++;
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