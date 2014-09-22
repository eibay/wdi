var word = "samplesample";
var gamePiece = [];
for (i = 0; i < word.length; i++) {gamePiece.push("-")};
var incorrects = 0;
var playedLetters = [];

console.log("Let's play!");
console.log("Here is the game board.");
console.log(gamePiece.join(" "));

function playerGuesses(letter) {
	if (letter.length > 1) {
		console.log("Enter only one letter, please.")
	}
	else if (playedLetters.indexOf(letter) != -1) {
		letterAlreadyPLayed();
	}
	else if (word.indexOf(letter) == -1){
		incorrectGuess(letter);
	}
	else {
		updateGamePiece(letter);
	}
	layOfTheLand();
}



function updateGamePiece(letter) {
	for (i = 0; i < word.length; i++) {
		if (letter == word[i]) {
			gamePiece[i] = letter;
		}
	}
	playedLetters.push(letter);
	return gamePiece;
}


function wordIncludesletter(letter) {console.log("That's a good gayss!")};
function letterAlreadyPLayed(letter) {console.log("You played that letter!")};
function incorrectGuess(letter) {
	playedLetters.push(letter);
	incorrects += 1;
	console.log("Nope it don't got that.")
};

function layOfTheLand() {
	if (gamePiece.indexOf("-") != -1 && incorrects < 8) {
		console.log("'" + gamePiece.join(" ") + "'");
		console.log("You've played the following letters:");
		console.log(playedLetters.join(" "));
	}
	else if (incorrects == 8) {
		console.log("The trapdoor drops!  You've lost and the hangman's dead!");
	}
	else if (gamePiece.indexOf("-") == -1) {
		console.log("You win!");
	}
}






