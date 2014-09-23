// HANGMAN LOGIC

var word = "volcano";
var correctGuesses = [];
var incorrectGuesses = [];
var turn = 0;

function letterInWord(letter) {
  return word.indexOf(letter) != -1;
}

function guess(letter) {
  if (alreadyGuessed(letter)) {
    return;
  }

  if (letterInWord(letter)) {
    correctGuess(letter);
    checkWon();
  } else {
    incorrectGuess(letter);
  }
}

function alreadyGuessed(letter) {
  return incorrectGuesses.concat(correctGuesses).indexOf(letter) != -1;
}

function correctGuess(letter) {
  correctGuesses.push(letter);
}

function incorrectGuess(letter) {
  incorrectGuesses.push(letter);
  turn++;
}

function checkWon() {
  for (var i = 0; i < word.length; i++) {
    if (correctGuesses.indexOf(word[i]) == -1 ) {
      return false
    }
  }

  console.log("YOU WON!");
  return true;
}

// UI

function hideUnguessed() {
  var display = "";

  for (var i = 0; i < word.length; i++) {
    if (correctGuesses.indexOf(word[i]) === -1) {
      display += "_"
    } else {
      display += word[i]
    }
  }

  return display;
}

