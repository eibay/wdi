var secretWord = "javascript"
var secretWordArray = secretWord.split("")
var length = secretWord.length
var answerArray = []
var counter = 8;
for (var i = 0; i < secretWordArray.length; i++){
	answerArray.push(" ");
};




function playGame() {
	console.log("The word contains " + length + " letters.")
	console.log("You have " + counter + " turns")
}

function guessLetter(guess) {
	if (secretWordArray.indexOf(guess) < 0 && counter > 0) {
		console.log("Wrong!");
		counter = counter - 1
		if (counter > 0) {
			console.log("You have " + counter + " turns remaining. Call function guessWord if you are ready to guess the word.")
		} else {
				console.log("You lose. Please refresh the page to start again.")}
	 } else if (secretWordArray.indexOf(guess) >= 0  && counter > 0) {
				
			for (var i = 0; i < secretWordArray.length; i++) {
					
				if (guess == secretWordArray[i]) {
					answerArray[i] = guess}}					
					console.log(answerArray.join(""));	
					counter = counter - 1;
					if (counter > 0) {
						console.log("You have " + counter + " turns remaining. Call function guessWord if you are ready to guess the word.")
					} else {
						console.log("You lose. Please refresh the page to start again.")}
	} else {
		console.log("Sorry, you are out of turns. Please refresh the page to start again.")
	} 	
}

function guessWord(answerWord) {
	if (counter == 0) {
		console.log("Sorry, you are out of turns. Please refresh the page to start again.")
	} else if (counter > 0 && answerWord == secretWord) {
		console.log("You win")
	} else if (counter > 0 && answerWord != secretWord) {
		counter = counter - 1 
		console.log("Wrong! You have " + counter + " turns remaining.")
	}
}

