var word = "rock"
var div = document.getElementsByClassName("game-word")[0]
var wordTag = document.createElement('h1')

var underScoreStr = ""

for(t = 0; t < word.length; t++) {
  if (word[t] == " ") {
      underScoreStr += " "
  } else {
      underScoreStr += "_"
  }
}


wordTag.innerText = underScoreStr
div.appendChild(wordTag)
var wordHash  = {}
var wrongGuesses = 8

var guesses = []


function fillIn() {
  for (key in wordHash) {
    if(wordHash[key] == true) {
      var index = word.indexOf(wordHash[key]);
      wordTag.innerText = toString(word[index])
    }
  }
}

function createWordHash (word) {
  for(i=0; i<word.length; i++){

    wordHash[word[i]] = false;
  }
}

createWordHash(word)

function guessLetter(letter){
  if (alreadyGuessed(letter)) {
    return;
  }

  if (isLetterInWord(letter)) {
    registerCorrect(letter);
  } else {
    registerIncorrect(letter)
  }

  return checkWon();
}

function alreadyGuessed(letter) {
  return guesses.indexOf(letter) != -1;
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
  }
}


var guessesLeft = document.getElementsByClassName("guesses-left")[0]
var guessedLetters = document.getElementsByClassName("guessed-letters")[0]
var letterInput = document.getElementById("letter")
var button = document.getElementById("guess-button")

guessesLeft.innerText = wrongGuesses
guessedLetters.innerText = guesses

button.addEventListener('click', function() {
  var letter = letterInput.value
  guessLetter(letter);

  guessesLeft.innerText = wrongGuesses
  guessedLetters.innerText = guesses

});




