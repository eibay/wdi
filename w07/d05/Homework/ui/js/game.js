window.onload = function(){

	getWord()
    setTimeout(function(){
      newGame()}, 500)

   function newGame(){
    winsDiv.innerText = wins;
    gameWord.innerText = ""
    answer_array = [];
    word_array = word.split("");
    
    for (var i =0; i < word_array.length; i++){
      answer_array.push("_");
      gameWord.innerText += "_";
    };
    plays = 8;
    guessesLeft.innerText = plays;
    lettersDiv.innerText = ""
    };

    function turn(letter){
    for (var i =0; i < word_array.length; i++){
     if(letter == word_array[i]){
        answer_array[i] = letter;
        gameWord.innerText[i].replace("-", letter);
      };
    };
    plays--;
  
    guessesLeft.innerText = plays;
    lettersDiv.innerText = (lettersDiv.innerText) +letter + ", ";
    showGameWord();
    gameWord.innerText = ""
     for (var i = 0; i < answer_array.length; i++){
      gameWord.innerText += answer_array[i];
    };
    response()
  };

  function showGameWord(){
     gameWord.innerText = ""
     for (var i = 0; i < answer_array.length; i++){
      gameWord.innerText += answer_array[i];
    };
  }

  function response(){

    if(answer_array.indexOf("_") == -1){
      // console.log("you win")
      guessesLeft.innerText = 'You Win!'
      wins++;
      addWins();
      console.log(wins);
      winsDiv.innerText = wins;
    
    }else if(plays > 0){
      console.log("guess again")
    
    }else{
      // console.log('you lose')
      guessesLeft.innerText = 'Game Over'
      gameWord.innerText = word;
      getWord();
      setTimeout(function(){
      newGame();}, 3000);
    };
  };


  new_game_button.addEventListener("click", function(){
    getWord()
    setTimeout(function(){
      newGame()}, 500)
  });

  guess_button.addEventListener("click", function(){
    if(input.value != ""){
      var letterInput = input.value.toLowerCase();
      turn(letterInput);
      input.value = "";
    };
  });

  input.addEventListener("keydown", function(e){
    if(e.keyIdentifier == "Enter" && input.value != ""){
      var letterInput = input.value.toLowerCase();
      turn(letterInput);
      input.value="";
    };
  });

  give_up_button.addEventListener("click", function(){
    gameWord.innerText = word;
    getWord();
    setTimeout(function(){
      newGame();}, 3000);

  })
};


