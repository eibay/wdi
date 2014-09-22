window.onload = function(){
  var matches = [];
  var misses = [];
  var guess_button = document.querySelector("button");
  var guessed_letter = document.querySelector("input");
  var word_div = document.querySelector("div.game-word");
  var word = word_div.innerText.toLowerCase();
  var guesses_left = document.querySelector("span.guesses-left");
  var letters_guessed = document.querySelector("span.guessed-letters");
  var counter = 0;
  var miss_counter = 0;
  var canvas = document.querySelector('canvas#hangman');
  var game = document.querySelector('div#game-over');

  function count(){
    counter += 1;
    guesses_left.innerText = 8 - counter;
    if (counter == 8){
      return game.innerText = "GAME OVER!"
    }
  }
  function missCount(){
    var missCount = misses.length;
    if (missCount == 1){
      drawHead();
    } else if (missCount == 2){
      drawTorso();
    }
  }

  function drawHead(){
    if (canvas.getContext){
      var ctx = canvas.getContext('2d');
      var centerX = canvas.width / 2;
      var centerY = (canvas.height / 2) - 40;
      var radius = 15;
      ctx.beginPath();
      ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
      ctx.fillStyle="#FFF";
      ctx.fill();
    }
  }

    function drawTorso(){
      if (canvas.getContext){
        var ctx = canvas.getContext('2d');
        var centerX = canvas.width / 2;
        var centerY = (canvas.height / 2) - 40;
        ctx.beginPath();
        // ctx.moveTo(0,0);
        // ctx.lineTo()
        ctx.moveTo(centerX, centerY);
        ctx.lineTo(centerX, (canvas.height / 2) + 30);
        ctx.strokeStyle="#FFF";
        ctx.lineWidth = 2;
        ctx.stroke();
      }
    }

  function noDupesInMisses(letter){
    for(var m=0;m<=misses.length;m++) {
      if (misses.indexOf(letter) == -1){
        misses.push(letter);
        missCount();
      }
  }
  }

  function noDupesInMatches(letter){
   for(var m=0;m<=matches.length;m++) {
     if (matches.indexOf(letter) == -1){
       matches.push(letter);
     }
  }
  }

  function matchGuess(letter, word){
    for(var i=0; i<word.length; i++) {
    if (letter == word[i]) {
      noDupesInMatches(letter);
    }
  }
    if (matches.indexOf(letter) == -1){
      noDupesInMisses(letter);
    }
    count();
  };

  function was_guessed(letter){
    if (matches.indexOf(letter) != -1 || misses.indexOf(letter) != -1){
      return true;
    } else {
      return false;
    }
  }

  guess_button.addEventListener("click", function(){
    var input = guessed_letter.value.toLowerCase();
    matchGuess(input, word);
    guesses_left.innerText = (8 - counter).toString();
    letters_guessed.innerText = matches + misses;
    guessed_letter.value = "";
    console.log("matches: " + matches);
    console.log("misses: " + misses);
  })
};
