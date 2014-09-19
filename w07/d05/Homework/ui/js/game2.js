//declare variables


var word = "michael" //this shall be variable later
var progressHash  = {}
var guessesLeft= 8
// var rightGuesses = 0

var wrongLetters = []
var rightLetters = []



console.log("Word length: " + word.length)



//creating a hash
function declareProgressHash (word) {
	for(i=0; i<word.length; i++){
		//no need to worry about dupicates cuz hash keys get overwritten
		progressHash[word[i]] = false;
	}
}

declareProgressHash(word)



function guessLetter(letter){
	if (alreadyGuessed(letter)) {
		return;
	}

	if (isLetterInWord(letter)) {
		registerCorrect(letter);
	} else {
		registerIncorrect(letter);
	}

	if(checkWon() == true) {
		console.log("You WIN! (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧*:･ﾟ✧");
	}

	if(checkLose() == true) {
		console.log("You LOSE! (╯°□°）╯︵ ┻━┻ ")
	}
}

function alreadyGuessed(letter) {
	return wrongLetters.indexOf(letter) != -1 || rightLetters.indexOf(letter) != -1;
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
	rightLetters.push(letter);


	console.log("GOOD GUESS! \n");
	console.log("Right letters: " + rightLetters);
	console.log("Wrong letters: " + wrongLetters);
	console.log("Wrong guesses left: " + guessesLeft);

}

function registerIncorrect(letter) {
	wrongLetters.push(letter);
	guessesLeft -= 1;

	console.log("WRONG! \n");
	console.log("Right letters: " + rightLetters);
	console.log("Wrong letters: " + wrongLetters);
	console.log("Wrong guesses left: " + guessesLeft);
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

function checkLose() {
	if(guessesLeft == 0) {
		return true;
	}
}

// 	var guessIsRight = false


// 	for(i=0; i<word.length; i++){
// 		if(progressHash[letter] == false){
// 			console.log(letter + " is in word");
// 			progressHash[letter] = true;
// 			console.log(progressHash)
// 			guessIsRight = true;

// 			rightLetters.push(letter)
// 		} 
// 		else {
// 			if wrongLetters.indexOf(letter) != -1
// 			wrongLetters.push(letter)
// 		}
// 	}
	

// 	if(guessIsRight != true){
// 		wrongGuesses += 1
// 		console.log("wrong guesses: " + wrongGuesses)
// 	}
// 	// insert something about wrong guesses
// }
