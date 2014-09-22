//get word from server
var word = ""
var xhr = new XMLHttpRequest
xhr.open('GET', 'http://127.0.0.1:4567/word');
xhr.send();
xhr.addEventListener("load", function(){
	word = xhr.response
	return word
});

//buttons
var giveUp = document.getElementsByClassName("button give-up")
var newGame = document.getElementsByClassName("button new-game")[0]
var guess = document.getElementById("guess-button")

//the game
newGame.addEventListener("click", function() {
	//update records
	xhr.open('POST', 'http://127.0.0.1:4567/games');
	xhr.send();
	//game set up
	console.log(word)
	var word_array = word.split("")
	var answer_array = []

	
	//guesses left creation
	var plays = 0
	var guesses_leftEl = document.getElementsByClassName("guesses-left")[0]
	var guesses_left = 8 - plays
	guesses_leftEl.innerText = String(guesses_left);


	//empty word array creation
	for (var i = 0; i < word_array.length; i++){
    answer_array.push("_ ")
  }
  var correctGuesses = answer_array.join(" ")
  var correctAnswerEl = document.getElementsByClassName("game-word")[0]
  correctAnswerEl.innerText = correctGuesses


  //give up button
	var giveUp = document.getElementsByClassName("button give-up")[0]
	console.log(giveUp)
	giveUp.addEventListener("click", function() {
		var correctAnswerEl = document.getElementsByClassName("game-word")[0]
		correctAnswerEl.innerText = word
		document.getElementsByClassName("game-play")[0].innerText = "Throwing in the towel, eh?"
	});


	//guess a letter, see what happens
  guess.addEventListener("click", function() {

  	//get letter guessed
  	if (document.getElementById("letter").value == ''){
  	window.alert("Please enter a letter");
  	}
  	if (document.getElementById("letter").value != ''){
		var letter = document.getElementById("letter").value
		
		//adds letter to used letters list
		document.getElementById("letter").value = ""
		var letterList = document.createElement("li")
		letterList.innerText = letter + " "
		var guessedLetters = document.getElementById("guessed-letters")
		guessedLetters.appendChild(letterList)
		}


		//guesses left
		plays++
		var guesses_leftEl = document.getElementsByClassName("guesses-left")[0]
		var guesses_left = String((8 - plays))
		guesses_leftEl.innerText = guesses_left;


		//correct letter placement
		for (var i = 0; i < word_array.length; i++){
   		if(letter == word_array[i]){
     		answer_array[i] = letter + " "
    	};
  	};

	  var correctGuesses = answer_array.join(" ")
	  correctAnswerEl = document.getElementsByClassName("game-word")[0]
	  correctAnswerEl.innerText = correctGuesses


	  //win, lose, or go again
	  if (answer_array.indexOf("_ ") == -1) {
	  	xhr.open('POST', 'http://127.0.0.1:4567/win');
			xhr.send();
 			document.getElementsByClassName("game-play")[0].innerText = "you won!" 		
 		} else if(plays > 7){
 			document.getElementsByClassName("game-play")[0].innerText = "you lost :("
 		} else if (plays < 8){
 		console.log('guess again!')
 		} else{
 		console.log('you lose')
 		};

 		//start over
 		newGame.innerText = "Restart"
 		newGame.addEventListener("click", function() {
 			document.location.reload(true);
 		});

	});
});
// };