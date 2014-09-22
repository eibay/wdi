window.onload = function(){  
var word = []
var wrongOptions = []
var correctOptions = []
var choices = []
var wordViews = {}
var gameResult = []

begginingValues()

function randomWord(){
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/word');
  xhr.send()
  xhr.addEventListener('load', function(){
   parsedWord = JSON.parse(xhr.response);
    word = [parsedWord.word.toLowerCase()]
    wordScreen()
    console.log(word)
      });
}
function wonLost(){
    won = gameResult.join("/").split("won").length - 1
    lost = gameResult.join("/").split("lost").length - 1
    alert("won " + won + " lost " + lost)
}

function begginingValues(){
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/values');
  xhr.send()
  xhr.addEventListener('load', function(){
    games = JSON.parse(xhr.response)
    gameResult = games
    wonLost()

  var spanGuessed = document.getElementsByClassName("guessed-letters")
  var h5_guessed = document.createElement("h5")
  spanGuessed[0].appendChild(h5_guessed)
  var leftSpan = document.getElementsByClassName("guesses-left")
  var h5_left = document.createElement("h1")
  leftSpan[0].appendChild(h5_left)
  h5_left.innerText = 8
  var wordPlacement = document.getElementsByClassName("game-word")
  wordPlacement[0].innerText = ""
  randomWord()
  buttonsEvent()
})
}

function results(){
  var xhr2 = new XMLHttpRequest();
  xhr2.open('GET', '/results?result='+gameResult[gameResult.length - 1]);
  xhr2.send()
  //count results and alerts
  randomWord()
}


function gettingValues(hash){
  var keys = Object.keys(hash);
  var values = keys.map(function(v) { return hash[v]; });
  var wordPlacement = document.getElementsByClassName("game-word")
  console.log(values.join(""))
  wordPlacement[0].innerText = values.join("")
}

function wordScreen(){
  wordViews ={}
  for(i=0; i < word[0].length; i++){
    wordViews[i]="#"
    }
  gettingValues(wordViews)
}





function buttonsEvent(){
  buttons = document.querySelectorAll("button")
    for (i = 0; i < buttons.length; i++){
      buttons[i].addEventListener('click', function(event){
        if(event.target.id == "guess-button" && wrongOptions.length < 8 && correctOptions.length != word[0].length){
          letter = document.querySelector("input").value.toLowerCase()
          console.log(letter.length)
            if (letter.length != 1){
              alert("TRY AGAIN WRONG AMOUNT OF LETTERS")
             }
          check(letter)
          guessedLetter()
          console.log(wrongOptions)
          console.log(correctOptions)
          document.querySelector("input").value = ""
          letterBoard()
        }else if (correctOptions.length == word[0].length && event.target.id == "guess-button"){
          alert("YOU ALREADY WON!, PLAY AGAIN")
        } else if (wrongOptions.length == 8 && event.target.id == "guess-button" ){
          alert("OUT OF TRIES, PRESS GIVE UP TO SEE THE WORD AND PLAY AGAIN!")
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
  } 


function checkWin(){
  if (correctOptions.length == word[0].length){
    alert("YOU WON!")
    gameResult.push("won")
  }
}

function giveUp(){
  console.log(correctOptions.length)
  console.log(word[0].length)
  if(event.target.className == "button give-up" && correctOptions.length != word[0].length){
    alert("YOU LOST!! THE WORD WAS "+word[0].toUpperCase())
    console.log(gameResult)
    gameResult.push("lost")
    results()
    guessedLetter() 
    wonLost()
    
  }else if (event.target.className == "button give-up" && correctOptions.length == word[0].length){
    alert("YOU WON ALREADY!")
  }else if (event.target.className == "button new-game"){
    alert("LETS PLAY AGAIN!")
    results()
    guessedLetter()
    wonLost()
 
  
  } 
}

  function checkTries(){
    if (wrongOptions.length >= 8){
      alert("You Lost! The Word was " +word[0]+" PRESS NEW GAME TO PLAY AGAIN")
      gameResult.push("lost")
    } else if(wrongOptions.length != 0){
      alert("TRY AGAIN")
    }
  }

function letterBoard(){
  letterIndex = 0
  for (i = 0; i < correctOptions.length; i++){
    howMany = (word[0].split(correctOptions[i]).length-1)
      if (howMany > 1){
        for(j = 0; j < word[0].length; j++){
          letterIndex = word[0].indexOf(correctOptions[i],j)
            if (letterIndex == - 1){
              break
            }
        wordViews[letterIndex] = correctOptions[i]
        wordViews.sort
        gettingValues(wordViews)
        console.log(wordViews)
        }
  
  } else if (howMany == 1){
    letterIndex = word[0].indexOf(correctOptions[i])
    console.log(letterIndex)
    wordViews[letterIndex] = correctOptions[i]
    wordViews.sort
    gettingValues(wordViews)
    console.log(wordViews)
  }
}
}

function check(letter){
  if (word[0].indexOf(letter) != -1 && letter.length == 1){
    checkArrayCorrect(letter)
  }else if (letter.length == 1) {
    checkArrayWrong(letter)
  }
}

function checkArrayCorrect(letter){
  if(correctOptions.indexOf(letter) == -1){
    choices.push(letter)
    howMany = (word[0].split(letter).length-1)
    for(i = 0; i < howMany; i++){
      correctOptions.push(letter)
      checkWin()
      console.log(correctOptions)
      }
  } else {
    alert("Already Tried That Letter")
  }
}

function checkArrayWrong(letter){
  if(wrongOptions.indexOf(letter) == -1){
    wrongOptions.push(letter)
    left()
    
     } else {
    alert("Already Tried That Letter, and it is still wrong")
  }
}

function guessedLetter(){
  h5_guessed = document.querySelector("h5")
  h5_guessed.innerText = wrongOptions.join(" ") + " "+  choices.join(" ")
}

function left(){
  h5_left = document.querySelector("h1")
  console.log(wrongOptions.length)
  h5_left.innerText = (8 - (wrongOptions.length))
  checkTries()
}

}