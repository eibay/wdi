
var secretWord = "HELLO WORLD"

var letter = "N"

var wrong_letters = []
var right_letters = []




// check to see if letter is in secret word
function checkGuess(letter){
	if (secretWord.indexOf(letter) != -1){
		right_letters.push(letter)
		gameWon(right_letters)
		return  right_letters

	} else {
		wrong_letters.push(letter)
		gameLost(wrong_letters)
		return wrong_letters
	}
}

// functions to execute if guessed letter is not in the secretWord

function gameLost(wrong_letters){
	if (wrong_letters.length == 8){
		console.log("You lose!")
	} else{
		console.log("Try another letter")
	}
}

// functions to execute if guessed letter is in the secretWord
function displayRightLetter(letter){
	var div = document.getElementById(letter)
	div.innerText= letter
	gameWon(right_letters)
}

function check(letter) {
  var allLetters = {};
  for(var i= 0; i < letter.length; i++) {
    var character = letter.charAt(i);
    if(character in allLetters) {
      allLetters[character] += 1;
    }
    else {
    	allLetters[character] = 1;
    }
  }if (allLetters.hasOwnProperty(" ")){
  	delete allLetters[" "]
  	return allLetters;
  }else {
  	return allLetters;
  }
};

function gameWon(right_letters){
	var lettersGuessed = check(secretWord)
	var numOfLetters = Object.keys(lettersGuessed).length

	if (numOfLetters == right_letters.length){
	console.log("You Won!")
	} else {
		console.log("Good guess! Can you figure out another letter?")
	}
}


checkGuess("A")
checkGuess("K")
checkGuess("J")

checkGuess("N")

checkGuess("S")


checkGuess("W")
checkGuess("R")
checkGuess("D")