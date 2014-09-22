/* Variables */

// Array of possible words
var words = ["sunrise", "table", "kitten", "planet", "soccer", "humidity"];

// The word that the player has to guesses
var word = "";

// Array to hold current state of the board
var board = [];

// Array to hold letters already guessed
var guessed = [];
var incorrect = [];

// Number of incorrect guesses
var numIncorrect = 0;

// Limit on incorrect guesses
var INCORRECT_LIMIT = 8;


/* Functions */

// Picks a random word from the array of possible words
function chooseWord() {
	word = words[Math.floor(Math.random()*words.length)];
	for (var i = 0; i < word.length; i++) {
		board.push("_");
	}
	console.log("Word chosen");
}

// Displays the board for the player
function displayBoard() {
	console.log(board.join(" "));
	console.log("Incorrect guesses: " + incorrect.join(" "));
}

// Checks if the given letter is in the word
function isInWord(letter) {
	for (var i = 0; i < word.length; i++) {
		if (word[i] == letter) {
			return true;
		}
	}
	return false;
}

// Adds a correct guess to the board
function addToBoard(letter) {
	for (var i = 0; i < word.length; i++) {
		if (word[i] == letter) {
			board[i] = letter;
		}
	}
}

// Checks whether the user has already guessed a letter
function isAlreadyGuessed(letter) {
	for (var i = 0; i < guessed.length; i++) {
		if (guessed[i] == letter) {
			return true;
		}
	}
	return false;
}

// Checks whether player won
function playerHasWon() {
	for (var i = 0; i < board.length; i++) {
		if (board[i] == "_") {
			return false;
		}
	}
	return true;
}

// Checks whether player lost
function playerHasLost() {
	return numIncorrect == INCORRECT_LIMIT;
}

// Processes a guess
function processGuess(guess) {
	if (isAlreadyGuessed(guess)) {
		console.log("You've already guessed the letter " + guess +
			". Please guess again.");
		return;
	}

	if (isInWord(guess)) {
		addToBoard(guess);
	} else {
		incorrect.push(guess);
		numIncorrect++;
	}
	guessed.push(guess);
	displayBoard();

	if (playerHasWon()) {
		console.log("Congratulations! You win!");
	} else if (playerHasLost()) {
		console.log("Sorry, you lose! Better luck next time!");
	}
}

// Resets all variables
function reset() {
	word = "";
	board = [];
	guessed = [];
	incorrect = [];
	numIncorrect = 0;
}

