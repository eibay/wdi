var wrongLetters = []
var rightLetters = []
var allLetters = []


  function startGame(){
    guessesLeftDiv = document.querySelector("span.guesses-left")
    guessesLeftDiv.innerText=8


    var gameword = divGameWord.children.length
    for (var i=0; gameword > i; i++){
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

  function getSecretWord(){
    var word = words[Math.floor(Math.random()*words.length)];
    secretWordToDisplay(word);
    return word
  }

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


  function checkGuess(letter){
    if (secretWord.indexOf(letter) != -1){
      allLetters.push(letter)
      rightLetters.push(letter)
      displayRightLetter(letter)
      return allLetters

    } else {
      allLetters.push(letter)
      wrongLetters.push(letter)
      displayWrongLetter(letter)
      return allLetters
    }
  }

  function displayWrongLetter(letter){
    var guessedLetters = document.querySelector("span.guessed-letters");
    guessedLetters.innerText= allLletters;
    gameLost(letter);
    guessesLeft();
  }

  function gameLost(wrong_letters){
    if (wrongLetters.length >= 8){
      console.log("You lose!")
      endGame()
    } else{
      console.log("Try another letter")
    }
  }

  function guessesLeft(){
    var guessesTaken = wrongLetters.length;
    guessesLeftDiv.innerText = 8-guessesTaken;
  }


  function displayRightLetter(letter){
    var guessedLetters = document.querySelector("span.guessed-letters")
    guessedLetters.innerText= allLetters

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
    gameWon(rightLetters)
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

    if (numOfLetters == rightLetters.length){
      alert("You Won! The word was " + secretWord)
    } else {
      console.log("Good guess! Can you figure out another letter?")
    }
  }

  function endGame(){
    alert("GAME OVER!")
  }

  var newGame = document.getElementsByClassName("button new-game")
  newGame[0].addEventListener("click", startGame)


  var giveUp = document.getElementsByClassName("button give-up")
  giveUp[0].addEventListener("click", endGame)
