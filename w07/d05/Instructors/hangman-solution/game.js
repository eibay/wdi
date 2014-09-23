// game logic

var word, correct, incorrect, turn;

function newGame() {
  word = "fleet";
  correct = [];
  incorrect = [];
  turn = 0;
}

function guessLetter(letter) {
  if (alreadyGuessed(letter)) return;

  if (inWord(letter)) {
    correctGuess(letter);
  } else {
    incorrectGuess(letter);
  }
};

function alreadyGuessed(letter) {
  return correct.concat(incorrect).indexOf(letter) != -1;
}

function inWord(letter) {
  return word.indexOf(letter) != -1;
}

function correctGuess(letter) {
  correct.push(letter);
}

function incorrectGuess(letter) {
  incorrect.push(letter);
  turn++;
}

function checkWon() {
  for (var i = 0; i < word.length; i++) {
    if ( correct.indexOf(word[i]) === -1 ) {
      return false;
    }
  }

  return true;
}

// UI/DOM

var input = document.querySelector('input#letter');
var button = document.querySelector('button#guess-button');

button.addEventListener('click', function() {
  guessLetter(input.value);
  input.value = "";
  render();
});

document.querySelector('button.new-game').addEventListener('click', function() {
  newGame();
  render();
});

function render() {
  var guessed = document.querySelector('span.guessed-letters');
  guessed.innerText = incorrect.join(', ');

  var remaining = document.querySelector('span.guesses-left');
  remaining.innerText = 8 - turn;

  var gameWord = document.querySelector('div.game-word');
  gameWord.innerText = displayGuessed();

  if (checkWon()) {
    alert("You won!");
  }
}

function displayGuessed() {
  var toDisplay = [];

  for (var i = 0; i < word.length; i++) {
    if (correct.indexOf(word[i]) != -1) {
      toDisplay.push(word[i]);
    } else {
      toDisplay.push("_");
    }
  }

  return toDisplay.join(" ");
}

// initialize game
newGame();
render();