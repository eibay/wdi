window.onload = function(){  
var word = []
var wrongOptions = []
var correctOptions = []
var wordViews = {}


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


  function randomWord(letter){
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5');
    xhr.send()
    xhr.addEventListener('load', function(){
      parsedWord = JSON.parse(xhr.response);
      word = [parsedWord.word.toLowerCase()]
      wordScreen()
      console.log(word)
       });
    

}

buttonsEvent()

  function buttonsEvent(){
    buttons = document.querySelectorAll("button")
      for (i = 0; i < buttons.length; i++){
        buttons[i].addEventListener('click', function(event){
        if(event.target.id == "guess-button" && wrongOptions.length < 8 && correctOptions.length != word[0].length){
          letter = document.querySelector("input").value
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
        }else if (correctOptions.length == word[0].length){
          alert("YOU ALREADY WON!, PLAY AGAIN")
        
        } else if (wrongOptions.length == 8){
          alert("OUT OF TRIES!, PLAY AGAIN!")
        } else {
        randomWord()
        wrongOptions = []
        correctOptions = []
        h5_left.innerText = 8
        giveUp()
        h5_guessed.innerText = ""

        }

        })
      }
  
} 

function checkWin(){
  if (correctOptions.length == word[0].length){
    alert("YOU WON!")
  }
}
function giveUp(){
  console.log(correctOptions.length)
  console.log(word[0].length)
  if(event.target.className == "button give-up"){
    alert("YOU LOST!!THE WORD WAS "+word[0].toUpperCase())
  } else {
    alert(word[0].toUpperCase()+" WAS THE WORD")

  }

}

function letterBoard(){
  wordPlacement= document.getElementsByClassName("game-word")
 

  for (i = 0; i < correctOptions.length; i++){
    letterIndex = word[0].indexOf(correctOptions[i])
    wordViews[letterIndex] = correctOptions[i]
    wordViews.sort
    gettingValues(wordViews)


    
    console.log(wordViews)
    
  }
}
function check(letter){
  if (word[0].indexOf(letter) != -1 && letter.length == 1){
    checkArrayCorrect(letter)
  }else if (letter.length == 1) {
    alert("TRY AGAIN")
    checkArrayWrong(letter)
  }
}

function checkArrayCorrect(letter){
  if(correctOptions.indexOf(letter) == -1){
    correctOptions.push(letter)
   checkWin()
  } else {
    alert("Already Tried That Letter")
  }
}

function checkArrayWrong(letter){
  if(wrongOptions.indexOf(letter) == -1){
    wrongOptions.push(letter)
    left()
     } else {
    alert("Already Tried That Letter")
  }
}
function guessedLetter(){
h5_guessed.innerText = correctOptions.join(" ") + " " +wrongOptions.join(" ")
}

function left(){
  h5_left.innerText = (8 - (wrongOptions.length))
}

}





