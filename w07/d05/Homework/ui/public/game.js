window.onload = function(){  
var word = []
var wrongOptions = []
var correctOptions = []
var choices = []
var hiddenWord = {}

beginningValues()

function beginningValues() {
  var lettersGuessedAlready = document.getElementsByClassName("guessed-letters")
  var guessedLetters = document.createElement("h5")
  lettersGuessedAlready[0].appendChild(guessedLetters)
  var guessesLeftSpan = document.getElementsByClassName("guesses-left")
  var guessesLeftNumber = document.createElement("h1")
  guessesLeftSpan[0].appendChild(guessesLeftNumber)
  guessesLeftNumber.innerText = 8
  var gameWord = document.getElementsByClassName("game-word")
  gameWord[0].innerText = ""
  randomWord()
  buttonsEvent()
};

function gettingValues(hash) {
  var keys = Object.keys(hash);
  var values = keys.map(function(v) { return hash[v]; });
  var gameWord = document.getElementsByClassName("game-word")
  console.log(values.join(""))
  gameWord[0].innerText = values.join("")
};

function hideWord() {
  hiddenWord = {}
  for(i=0; i < word[0].length; i++) {
    hiddenWord[i]="#"
    }
  gettingValues(hiddenWord)
};

function randomWord(letter) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'http://api.wordnik.com/v4/words.json/randomWord?minCorpusCount=10000&minDictionaryCount=20&excludePartOfSpeech=proper-noun,proper-noun-plural,proper-noun-posessive,suffix,family-name,idiom,affix&hasDictionaryDef=true&includePartOfSpeech=noun,verb&limit=26&maxLength=7&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5');
  xhr.send()
  xhr.addEventListener('load', function() {
    parsedWord = JSON.parse(xhr.response);
    word = [parsedWord.word.toLowerCase()]
    hideWord()
    console.log(word)
      });
};

function buttonsEvent() {
  buttons = document.querySelectorAll("button")
    for (i = 0; i < buttons.length; i++){
      buttons[i].addEventListener('click', function(event) {
        if(event.target.id == "guess-button" && wrongOptions.length < 8 && correctOptions.length != word[0].length) {
          letter = document.querySelector("input").value.toLowerCase()
          console.log(letter.length)
            if (letter.length != 1){
              alert("Try again!")
             }
    checkLetter(letter)
    guessedLetter()
    console.log(wrongOptions)
    console.log(correctOptions)
    document.querySelector("input").value = ""
    letterBoard()
    } else if (correctOptions.length == word[0].length && event.target.id == "guess-button"){
          alert("You won! Play again!")
    } else if (wrongOptions.length == 8 && event.target.id == "guess-button" ){
          alert("You're out of tries! Play again!")
          document.querySelector("input").value = ""
    } else {
          wrongOptions = []
          correctOptions = []
          choices = []
          giveUp()
          left()
        }
      })
    }
}; 

function checkWin() {
  if (correctOptions.length == word[0].length) {
    alert("Congratulations! You win!")
  }
}

function giveUp() {
  console.log(correctOptions.length)
  console.log(word[0].length)
  if(event.target.className == "button give-up" && correctOptions.length != word[0].length) {
    alert("Sorry! You lose! The word was "+word[0]())
    guessedLetter()  
    randomWord()
  } else if (event.target.className == "button give-up" && correctOptions.length == word[0].length) {
    // alert("You win!")
     guessedLetter()  
    randomWord()
  } else if (event.target.className == "button new-game") {
   guessedLetter()
   randomWord()
  } 
};

function checkTries() {
  if (wrongOptions.length >= 8) {
      alert("Sorry, you lose!")
    } else if (wrongOptions.length != 0) {
      alert("Try again!")
    }
}; 

function letterBoard() {
  letterIndex = 0
  for (i = 0; i < correctOptions.length; i++) {
    howMany = (word[0].split(correctOptions[i]).length-1)
      if (howMany > 1) {
        for(j = 0; j < word[0].length; j++) {
          letterIndex = word[0].indexOf(correctOptions[i],j)
            if (letterIndex == - 1) {
              break
            }
        hiddenWord[letterIndex] = correctOptions[i]
        hiddenWord.sort
        gettingValues(hiddenWord)
        console.log(hiddenWord)
};
  
  } else if (howMany == 1) {
      letterIndex = word[0].indexOf(correctOptions[i])
      console.log(letterIndex)
      hiddenWord[letterIndex] = correctOptions[i]
      hiddenWord.sort
      gettingValues(hiddenWord)
      console.log(hiddenWord)
    }
  }
};

function checkLetter(letter) {
  if (word[0].indexOf(letter) != -1 && letter.length == 1) {
    checkArrayCorrect(letter)
  } else if (letter.length == 1) {
    checkArrayWrong(letter)
  }
};

function checkArrayCorrect(letter) {
  if (correctOptions.indexOf(letter) == -1) {
    choices.push(letter)
    howMany = (word[0].split(letter).length-1)
    for(i = 0; i < howMany; i++) {
      correctOptions.push(letter)
      checkWin()
      console.log(correctOptions)
      }
  } else {
    alert("Try a different letter!")
  }
};

function checkArrayWrong(letter) {
  if (wrongOptions.indexOf(letter) == -1) {
    wrongOptions.push(letter)
    left()
    
     } else {
    alert("Try a different letter!")
  }
};

function guessedLetter() {
  guessedLetters = document.querySelector("h5")
  guessedLetters.innerText = wrongOptions.join(" ") + " "+  choices.join(" ")
};

function left() {
  guessesLeftNumber = document.querySelector("h1")
  console.log(wrongOptions.length)
  guessesLeftNumber.innerText = (8 - (wrongOptions.length))
  checkTries()
};

};