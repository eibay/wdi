window.onload = funtion(){

  var words = ['hamster', 'popsicle', 'palm', 'future'];
  var correctLetters = []
  var incorrectLetters = []
  var maxGuesses = 8
  var wordHash = {}

  var shown = document.getElementsByClassName("shown")
  shown[0].innerText = ""

  var spanLettersGuessed = document.getElementsByClassName("guessed-letters")

  var maxGuesses = document.getElementsByClassName("guesses-left")
  maxGuesses.innerText = maxGuesses



  function chooseWord() {
    return words[Math.floor(Math.random() * words.length)];
    // takes a words array and then returns a random element of the array
  }

  function blanksFromAnswer(answerWord){
  // pass in string argument, to return a new string with each letter replaced with underscore
    var result = " ";
    for (i in answerWord) {
      result = "_" + result;
      // concatenates result for every letter in the string
    }
    return result;
  } 

  function alterAt ( n, c, originalString ) {
    // concant string to return a new string with the correct letter replaced
    // parameter n is the position that the letter should be replaced at, originalString is the source string, parameter c is the character to insert
    return originalString.substr(0,n) + c + originalString.substr(n+1,originalString.length);     
  }


  function guessLetter(letter, shown, answer){
    // takes a letter argument to be matches against the answer
    // if the letter is in the answer then we need to replace the "_" characters with the appropriate letter
    // shown is what is being displayed to the user
    var checkIndex = 0;
    // check to see if there are multiples of the same letter in the answer

    checkIndex = answer.indexOf(letter);
    var checkLetter = -1;
    // this variables will hold the indexOf()
    checkLetter = answer.indexOf(letter);
    // Single Argument Version starting at 0
      while (checkIndex >= 0) {

        shown = alterAt( checkIndex, letter, shown );
        // replaces the letter in shown with alterAt() and then stores in shown
        checkIndex = answer.indexOf( letter, checkIndex + 1);
        // using the other version of indexOf() -> indexOf ( match, start ) match is the thing to be matched and start is what index to start at
      }

      return shown;
    }

  function guessedLetter(){

  }

  function guessButton(){
    button = document.getElementsByClassName("button")
      for (i = 0; i < button.length; i++){
        button[i].addEventListener('click', function(answer){
          if(answer.target.id == "guess-button" && incorrectLetters.length < 8 && correctLetters.length != result[0].length )

        })
      }
  } 

// var recursiveAsyncReadLine = function () {
//   rl.question('Whats your guess?', function (answer) {
//     if (incorrect_num>7) {//we need some base case, for recursion
//       log('You lose Loser');
//       return rl.close();

//     } else if ((incorrect_num<7) && (correct_num==secret_word.length)) {
//       log('You won Winner');
//       return rl.close(); //closing RL and returning from function.

//     } else if (secret_word.indexOf(answer) !== -1){  
//       log('Got it! Your answer was: "', answer, '"');
//       correct_num = correct_num + 1;
//       recursiveAsyncReadLine();

//     } else {
//       log('The letter didnt match')
//       incorrect_num = incorrect_num + 1;
//       recursiveAsyncReadLine();
//     }
//     recursiveAsyncReadLine(); //Calling this function again to ask new question
//   });
// };





function giveUp(){
  var chooseWord = document.getElementsByClassName('game-word');

}

// add event listener to 'give up' button
var giveUp=document.getElementsByClassName('button give-up');
  giveUp.addEventListener('click', function(){
    startOver()
  })

// add event listener to 'new game' button
var newGame = document.getElementsByClassName('button new-game');
  newGame.addEventListener('click', function(){
    startOver()
  });

function startOver(){
  var gameWord = document.getElementById('game-word');
    gameWord.innerHTML="New Game"
    chooseWord()
}











// var readline = require('readline');
// var log = console.log;

// var rl = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// var secret_word = 'hamster';
// console.log('The number of letter is ' + secret_word.length);

// var correct_num = 0;
// var incorrect_num = 0;

// var recursiveAsyncReadLine = function () {
//   rl.question('Whats your guess?', function (answer) {
//     if (incorrect_num>7) {//we need some base case, for recursion
//       log('You lose Loser');
//       return rl.close();

//     } else if ((incorrect_num<7) && (correct_num==secret_word.length)) {
//       log('You won Winner');
//       return rl.close(); //closing RL and returning from function.

//     } else if (secret_word.indexOf(answer) !== -1){  
//       log('Got it! Your answer was: "', answer, '"');
//       correct_num = correct_num + 1;
//       recursiveAsyncReadLine();

//     } else {
//       log('The letter didnt match')
//       incorrect_num = incorrect_num + 1;
//       recursiveAsyncReadLine();
//     }
//     recursiveAsyncReadLine(); //Calling this function again to ask new question
//   });
// };

// recursiveAsyncReadLine();




