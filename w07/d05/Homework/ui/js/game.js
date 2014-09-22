window.onload = function(){


var secretWordArray = secretWord.split("");
var answerArray = [];
var counter = 8;
for (var i = 0; i < secretWordArray.length; i++){
	answerArray.push(" ");
};


var guessesLeft = document.getElementsByClassName("guesses-left")[0];
var guessedLetters = document.getElementsByClassName("guessed-letters")[0];
var answerWordDisplay = document.getElementsByClassName("game-word")[0];
var giveUpButton = document.getElementsByClassName("button give-up")[0];
var newGameButton = document.getElementsByClassName("button new-game")[0];
var guessButton = document.getElementById("guess-button");


giveUpButton.addEventListener("click", function(){
	counter = 0
	var guessesLeft = document.getElementsByClassName("guesses-left")[0];
	guessesLeft.innerText = counter
	answerWordDisplay.innerText = "The correct word was " + secretWord + ". You lose.";
});

newGameButton.addEventListener("click", function(){
	counter = 8;
	guessesLeft.innerText = counter;
	guessedLetters.innerText = "";
	answerArray = [];
	answerWordDisplay.innerText = "";
	secretWord = [];
	newWord();
	secretWord = secretWord.toString();
});

function newWord() {
  var xhr = new XMLHttpRequest();
			
    	xhr.addEventListener('load', function(){
    	var response = JSON.parse(xhr.response);
    	secretWord.push = response;
    	});

    	xhr.open("GET", "http://127.0.0.1:2000/new_word", true);
			xhr.send();
    }

guessButton.addEventListener("click", function() {
	var guess = document.getElementById("letter").value;
	guessLetter(guess);
});

function guessLetter(guess) {
	if (counter >= 0) {
	if (secretWordArray.indexOf(guess) < 0 && counter > 0) {
		counter = counter - 1;
		guessesLeft.innerText = counter;
		guessedLetters.innerText = guessedLetters.innerText + guess;
		answerWordDisplay.innerText = answerArray.join("");
		document.getElementById("letter").value = "";
	 
	 } else if (secretWordArray.indexOf(guess) >= 0  && counter > 0) {
				
			for (var i = 0; i < secretWordArray.length; i++) {		
				if (guess == secretWordArray[i]) {
					answerArray[i] = guess;}}

			if (answerArray.join("") != secretWord) {
				answerWordDisplay.innerText = answerArray.join("");	
				counter = counter - 1;
				guessesLeft.innerText = counter;
				guessedLetters.innerText = guessedLetters.innerText + guess;
				document.getElementById("letter").value = "";}
			else {
				answerWordDisplay.innerText = secretWord + " - You guessed it!";
				counter = 0;
				guessesLeft.innerText = counter;
				guessedLetters.innerText = guessedLetters.innerText + guess;
				document.getElementById("letter").value = "";}
			
			
	}	else if (secretWordArray.indexOf(guess) < 0 && counter == 0) {
				answerWordDisplay.innerText = "The correct word was " + secretWord + ". You lose.";
				counter = 0;

	} else if (secretWordArray.indexOf(guess) >= 0  && counter == 0) {
			if (counter == 0 && answerArray.join("") == secretWord) {
						answerWordDisplay.innerText = secretWord + " - You guessed it!";
						counter = 0;
			} else if (counter == 0 && answerArray.join("") != secretWord) {
						answerWordDisplay.innerText = "The correct word was " + secretWord + ". You lose.";}
						counter = 0;
					} 
				};
};
};


