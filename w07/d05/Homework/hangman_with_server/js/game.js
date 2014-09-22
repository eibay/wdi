var word = "dog"
var div = document.getElementsByClassName("game-word")[0]
var letterList = document.getElementById('letter-list')

var wordHash  = {}
var wrongGuesses = 8
var guesses = []

// 
// 
// 
function getWord() {
	var xhr = new XMLHttpRequest();
	xhr.addEventListener('load', function() {
		var word = ''
		
	})
}


function changeSpacesTo(character) {
	for(l=0; l < word.length; l++) {	
		var letter = document.createElement('li')
		letter.className = word[l]
		if (word[l] == " ") {
			letter.innerHTML = " "
			letterList.appendChild(letter)
		} else {
			letter.innerHTML = character
			letterList.appendChild(letter)
		}	
	}
}
changeSpacesTo('?')


function createWordHash (word) {
	for(i=0; i<word.length; i++){

		wordHash[word[i]] = false;
	}
}

createWordHash(word)


function fillIn(letter) {
	for (key in wordHash) {
		if (wordHash[key] == true) {
			var spaceToFill = document.getElementsByClassName(letter)
			for (i=0; i < spaceToFill.length; i++) {
				spaceToFill[i].innerHTML = letter
			}
		}
	}
}

function guessLetter(letter){
	if (alreadyGuessed(letter)) {
		alert('You already guessed that stupid.')
		return;	
	}

	if (isLetterInWord(letter)) {
		registerCorrect(letter);
		fillIn(letter);
	} else {
		registerIncorrect(letter)
	}

	return checkWon();
}

function alreadyGuessed(letter) {
	return guesses.indexOf(letter) != -1 || guesses.indexOf(letter) != -1;
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
	wordHash[letter] = true;
	guesses.push(letter);
}

function registerIncorrect(letter) {
	guesses.push(letter);
	wrongGuesses--;
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

function checkLost() {
	if (wrongGuesses == 0) {
		return true;
	} else {
		return false;
	}
}
// 
// 
// 

var guessesLeft = document.getElementsByClassName("guesses-left")[0]
var guessedLetters = document.getElementsByClassName("guessed-letters")[0]
var letterInput = document.getElementById("letter")
var guessButton = document.getElementById("guess-button")
var giveUpButton = document.getElementsByClassName("button give-up")[0]
var newGameButton = document.getElementsByClassName("button new-game")[0]
var letters = letterList.children

guessesLeft.innerText = wrongGuesses
guessedLetters.innerText = guesses

guessButton.addEventListener('click', function() {
	var letter = letterInput.value;
	guessLetter(letter)
	fillIn(letter)

	guessesLeft.innerText = wrongGuesses
	guessedLetters.innerText = guesses

	var status = document.createElement('h1')

	if (checkLost() == true) {
		status.innerText = "LOSER!!"
		div.insertBefore(status, letterList)
	} else if (checkWon() == true) {
		status.innerText = "WINNER!!"
		div.insertBefore(status, letterList)
	}


})

giveUpButton.addEventListener('click', function() {
	for (i=0; i < letters.length; i++) {
		letters[i].innerHTML = letters[i].className
	}

	message = document.createElement('h1')
	message.className = 'message'
	message.innerText = 'Boooooooooooo!!'
	giveUpButton.parentNode.insertBefore(message, giveUpButton)

})

// newGameButton.addEventListener('click', function() {
// 	location.reload();

// })




















