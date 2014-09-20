window.onload = function(){

	var word = "winner";

	var word_array= word.split("")
	var answer_array = [];
	var plays = 8
	var guessesLeft= document.getElementsByClassName("guesses-left")[0];
	var gameWord = document.getElementsByClassName("game-word")[0];
	var lettersDiv = document.getElementsByClassName("guessed-letters")[0];
	var guess_button = document.getElementById("guess-button");
	var input = document.querySelector("input#letter");
	var new_game_button = document.getElementsByClassName("button new-game")[0];
	var give_up_button = document.getElementsByClassName("button give-up")[0];

	function newGame(){
		
		word_array = [];
		answer_array = [];
		word_array= word.split("");
		for (var i =0; i < word_array.length; i++){
	  	answer_array.push("_")};
		showGameWord();
		plays = 8;
		guessesLeft.innerText = plays;
		lettersDiv.innerText = ""
		
	};

	var response =function(){

	 	if (answer_array.indexOf("_") == -1) {
	 		console.log("you win")
	 		guessesLeft.innerText = ''

	 	} else if(plays > 0){
	 		console.log("guess again")
	 	} else{
	 		console.log('you lose')
	 		newGame()
	 	};
	};
	
	var turn = function(letter){
		for (var i =0; i < word_array.length; i++){
	   if(letter == word_array[i]){
	      answer_array[i] = letter;
	      gameWord.innerText[i].replace("-", letter);
	    };
	  };
	  plays--;
	
	  guessesLeft.innerText = plays;
	  lettersDiv.innerText = (lettersDiv.innerText) +letter + ", ";
	  console.log(answer_array);
	  showGameWord();
	  response()

	};

	var showGameWord = function(){
		 gameWord.innerText = ""
		 for (var i = 0; i < answer_array.length; i++){
			gameWord.innerText += answer_array[i];
		};
	}

	
	give_up_button.addEventListener("click", function(){
		gameWord.innerText = word;
		setTimeout(function(){
			newGame();}, 3000);

	})

	new_game_button.addEventListener("click", function(){
		newGame()
	});

	guess_button.addEventListener("click", function(){
		turn(input.value);
		input.value = "";
	});

	input.addEventListener("keydown", function(e){
		if(e.keyIdentifier == "Enter"){
			turn(input.value)
			input.value="";
		};
	});

	newGame()

};



