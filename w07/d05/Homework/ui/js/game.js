window.onload = function(){
  var matches = [];
  var misses = [];
  var guess_button = document.querySelector("button");
  var guessed_letter = document.querySelector("input");
  var word_div = document.querySelector("div.game-word");
  var word = word_div.innerText.toLowerCase();
  var guesses_left = document.querySelector("span.guesses-left");
  var letters_guessed = document.querySelector("span.guessed-letters");


  function noDupesInMisses(letter){
    for(var m=0;m<=misses.length;m++) {
      if (misses.indexOf(letter) == -1){
        misses.push(letter);
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
    guesses_left.innerText = "blah"
    letters_guessed.innerText = matches + misses;
    guessed_letter.value = "";
    console.log("matches: " + matches);
    console.log("misses: " + misses);
  })
};
