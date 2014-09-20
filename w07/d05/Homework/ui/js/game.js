//declare variables

var word = "octopus"
var progressHash  = {}
var guessesLeft= 8
var wrongLetters = []
var rightLetters = []



var inputBox = document.querySelector('input')
var div_GuessedLetters = document.getElementById("guessed-letters")

var div_GuessesLeft = document.getElementById("guesses-left")
div_GuessesLeft.innerText = guessesLeft








//for guessing letters
function enterInput() {
	var guess = inputBox.value // define inside
  	guessLetter(guess)
 	div_GuessedLetters.innerText += " " + guess + ","
 	div_GuessesLeft.innerText = guessesLeft
 	inputBox.value = "" //wow this is so cool!
}

var btn_guess = document.getElementById("guess-button")
btn_guess.addEventListener('click', function(event) {
	enterInput()
	
})

inputBox.addEventListener('keypress', function(event) {
	if(event.keyCode == 13) {
		enterInput()

	}
})




//refresh page
function refresh() {
	document.location.reload(true);
}

//for the new game button -- it refreshes
var btn_newGame = document.getElementById("new-game");
btn_newGame.addEventListener('click', function(event) {
	refresh();
})

//for giving up -- word shows, then page reloads
var btn_giveUp = document.getElementById("give-up");
btn_giveUp.addEventListener('click', function(event) {
	//reveal word
	gameWord.innerText = word;

	//reload page in 2 seconds
	setTimeout(refresh, 2000);
})


var gameWord = document.getElementById('game-word');

//mask the word so it is a bunch of dashes
function maskWord() {
	var maskedWord = "";
	for(i=0; i<word.length; i++){
		maskedWord += "_ ";
	}
	gameWord.innerText = maskedWord;
	return maskedWord
}
maskWord();




// var newMaskedWord = maskWord();
// reveal letters as they are guessed right
function showLetter(letter) {
	// for(i=0; i=word.length; i++){
	// 	if(letter==word[i]){
	// 		console.log("we shoudl show this letter")
	// 	}
	// }
}









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
	console.log("you guessed: " + letter)
	if (alreadyGuessed(letter)) {
		return;
	}

	if (isLetterInWord(letter)) {
		registerCorrect(letter);
	} else {
		registerIncorrect(letter);
	}

	if(checkWon() == true) {
		alert("You WIN! (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧*:･ﾟ✧");
		document.location.reload(true);
	}

	if(checkLose() == true) {
		alert("You LOSE! (╯°□°）╯︵ ┻━┻ ")
		document.location.reload(true);
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
