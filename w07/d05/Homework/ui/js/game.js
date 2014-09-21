

var guessLetter = document.getElementById("guess-button")
guessLetter.addEventListener("click", getGuess)
// 
function getGuess(){
  var guess = document.getElementById("letter")
  var letter = guess.value
  checkGuess(letter)
  return letter
}

// establish secret word in backend (from a list of words, and it gives a category)
words = ["JELLO", "FRUIT FLY", "ORANGUTANG", "YODEL", "POOP"]

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
    letterDiv.innerText = " "
    divGameWord.appendChild(letterDiv)
    
  } return letterDiv
}


// get secret string.toLowerCase().trim()
var secretWord = getSecretWord()

 // user guesses a letter
var letter = "H"

// grab info on enter or click 
// addEventListener("click"/keypress, checkGuess(letter))


var wrong_letters = []
var right_letters = []




// check to see if letter is in secret word
function checkGuess(letter){
  if (secretWord.indexOf(letter) != -1){
    right_letters.push(letter)
    displayRightLetter(letter)
    return  right_letters

  } else {
    wrong_letters.push(letter)
    displayWrongLetter(wrong_letters)
    return wrong_letters
  }
}

// functions to execute if guessed letter is not in the secretWord
function displayWrongLetter(letter){
  var guessedLetters = document.querySelector("span.guesses-left")
  guessedLetters.innerText= letter.toString()
  gameLost(letter)
}

function gameLost(wrong_letters){
  if (wrong_letters.length >= 8){
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

function gameWon(){
  var letters = check(secretWord)
  var numOfLetters = Object.keys(letters).length

  if (numOfLetters == right_letters.length){
  console.log("You Won!")
  } else {
    console.log("Good guess! Can you figure out another letter?")
  }
}