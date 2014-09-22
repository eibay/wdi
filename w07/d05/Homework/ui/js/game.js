//declare variables
// all letters guessed will be false, until the guessed word has been spelled out. it will then be all true.

// word to be guessed
var word = "cats"; 
var wordarray = [];  

var guessesLeft = 5;

var letterHash  = {};

var wrongLetters = [];
var rightLetters = [];



// console.log("Word length: " + word.length)

//creating a hash
function declareletterHash (word) {
	var gameWord =document.getElementById("game-word")
	for(i=0; i<word.length; i++){
		
	letterHash[word[i]] = false; 
	}
}

declareletterHash(word)
// console.log(letterHash)

// letters and their approriate responses
function guessLetter(letter){
	if (alreadyGuessed(letter)) {
		alert("You've already guessed that!");
		return;
	}

	if (letterInWord(letter)) {
		registerCorrect(letter);
		// console.log("Correct!")
	} else {
		registerIncorrect(letter)
		// console.log("Wrong!")
	}

	if(checkWon() == true) {
		alert("Congratulations, you've won!");
	}

	if(checkLose() == true) {
		alert("You lost!");
	}
}

// returning all letters that are right or wrong. 
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

// showing correct and wrong responses with guesses left
function registerCorrect(letter) {
	letterHash[letter] = true;
	rightLetters.push(letter);

	console.log("Correct!");
	console.log("Right letters: " + rightLetters);
	console.log("Wrong letters guessed: " + wrongLetters);
	console.log("Wrong guesses left: " + guessesLeft);
}

// showing correct and wrong responses with guesses left
function registerIncorrect(letter) {
	wrongLetters.push(letter);
	guessesLeft -= 1;

	console.log("Wrong!");
	console.log("Right letters: " + rightLetters);
	console.log("Wrong letters guessed: " + wrongLetters);
	console.log("Wrong guesses left: " + guessesLeft);
}

// checking if user has won
function checkWon() {
	allTrue = true;

	for (key in letterHash) {
		if (letterHash[key] == false) {
			allTrue = false;
		}
	}
	return allTrue;

}

// checking if user has lost
function checkLose() {
	if(guessesLeft == 0) {
		return true;
	}
}

function hideUnguessed() {
	var display = "";
	for (i=0; i<word.length; i++){
		if(rightLetters.indexOf(word[i]) === -1) {
			display += "_"
		}

	}		
}
// guessLetter("c")
// guessLetter("a")


