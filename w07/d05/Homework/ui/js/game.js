var word = "michael"
var wordHash  = {}
var wrongGuesses = 0

var wrongLetters = []
var rightLetters = []

console.log("Word length: " + word.length)


function declareWordHash (word) {
  for(i=0; i<word.length; i++){

    WordHash[word[i]] = false;
  }
}

declareWordHash(word)

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
}

function registerIncorrect(letter) {
  wrongLetters.push(letter);
  wrongGuesses++;
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