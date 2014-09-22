var wrong_letters = []
var right_letters = []
var all_letters = []

var newGame = document.querySelectorAll("button")
newGame[2].addEventListener("click", startGame)

var giveUp = newGame[1]
giveUp.addEventListener("click", endGame)

function startGame(){
  // need to user-proof the input and word: string.toLowerCase().trim()
  // setting global variables 
  guessesLeftDiv = document.querySelector("span.guesses-left")
  guessesLeftDiv.innerText=8

  // clears previous word
  var n = divGameWord.children.length
  for (var i=0; n > i; i++){
    var GameWord = document.querySelector("div.game-word")
    GameWord.removeChild(GameWord.firstChild)
  }
  
  secretWord = getSecretWord()

  var guessLetter = document.getElementById("guess-button")
  guessLetter.addEventListener("click", getGuess)
  
  var lettersGuessedAlready = document.querySelector("span.guessed-letters")
  lettersGuessedAlready.innerText="";
}

words = ["JELLO", "FRUIT FLY", "YODEL"]

// words = [ {{URBAN_DICTIONARY}} ]

// gets random secret word from array
function getSecretWord(){
  var word = words[Math.floor(Math.random()*words.length)];
  secretWordToDisplay(word);
  return word
}

// creates div for each letter in the secret word with an ID = letter ex <div id="H"> </div>
var divGameWord = document.querySelector("div.game-word")

function secretWordToDisplay(secretWord){
  var array = secretWord.split("")
  for (var i=0; i<array.length; i++){
    var letterDiv = document.createElement("div")
    letterDiv.className = array[i]
    if (array[i] == " "){
      letterDiv.innerText = " "
    }else {
      letterDiv.innerText = "-"
    }divGameWord.appendChild(letterDiv)
  } 
}

function getGuess(){
  var guess = document.getElementById("letter");
  var letterGuessed = guess.value;
  checkGuess(letterGuessed);
  guess.value="";
} 

// check to see if letter is in secret word
function checkGuess(letter){
  if (secretWord.indexOf(letter) != -1){
    all_letters.push(letter)
    right_letters.push(letter)
    displayRightLetter(letter)
    return all_letters

  } else {
    all_letters.push(letter)
    wrong_letters.push(letter)
    displayWrongLetter(letter)
    return all_letters, wrong_letters
  }
}

// functions to execute if guessed letter is not in the secretWord
function displayWrongLetter(letter){
  var guessedLetters = document.querySelector("span.guessed-letters");
  guessedLetters.innerText= all_letters;
  gameLost();
  guessesLeft();
}

function gameLost(){
  if (wrong_letters.length >= 8){
    console.log("You lose!")
    endGame()
  } else{
    console.log("Try another letter")
  }
}

function guessesLeft(){
  var guessesTaken = wrong_letters.length;
  guessesLeftDiv.innerText = 8-guessesTaken;
}


// functions to execute if guessed letter is in the secretWord
function displayRightLetter(letter){
  // displays letter in "Letters Guessed already div"
  var guessedLetters = document.querySelector("span.guessed-letters")
  guessedLetters.innerText= all_letters

  // displays letters in word
  var div = document.getElementsByClassName(letter)
  if (div.length > 1){  
    for (var i=0; i<div.length; i++){
      var divv = document.getElementsByClassName(letter)
      divv[i].innerText =letter
    }
  }
  else{  
    var divv = document.getElementsByClassName(letter)
    divv[0].innerText =letter
  }
  gameWon(right_letters)
}

// checks to see length of word not counting double letters - which will gives the word length if won
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

function gameWon(){
  var letters = check(secretWord)
  var numOfLetters = Object.keys(letters).length

  if (numOfLetters == right_letters.length){
    alert("You Won! The word was " + secretWord)
  } else {
    console.log("Good guess! Can you figure out another letter?")
  }
}

function endGame(){
  alert("GAME OVER!")
}




