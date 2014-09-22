window.onload = function(){

var secret_words = ["the","of","and","a","to","in","is","you","that","it","he","was","for","on","are","as","with","his","they","I","at","be","this","have","from","or","one","had","by","word","but","not","what","all","were","we","when","your","can","said","there","use","an","each","which","she","do","how","their","if","will","up","other","about","out","many","then","them","these","so","some","her","would","make","like","him","into","time","has","look","two","more","write","go","see","number","no","way","could","people","my","than","first","water","been","call","who","oil","its","now","find","long","down","day","did","get","come","made","may","part"];

var secret_word = secret_words[Math.floor(Math.random() * secret_words.length)];

// var xhr = new XMLHttpRequest();
// console.log('XMLHttpRequest');
// xhr.open('GET', '/random_word');
// xhr.send();

// xhr.addEventListener('load', function(ev){
//   console.log(ev);
// });
var secret_word_length = secret_word.length;

var guess_letters = [];
var correct_letters = []
var guessed_num = 0;
var correct_num = 0;
var incorrect_num = 0;
var button = document.querySelector('button');
var give_up = document.getElementsByClassName('give-up')[0];
var new_game = document.querySelectorAll('button')[2];

document.querySelector('aside div span').innerText = 'Letters Guessed Already: ';

document.querySelector('figure span').innerText = 'Guesses Left: ' + 8;

document.getElementsByClassName('game-word')[0].innerText = 'The number of letters in a word is: ' + secret_word.length;

button.addEventListener('click', function() {

  var guess_letter = document.getElementById('letter').value;

  guess_letters.push(guess_letter);
  
  if (incorrect_num>7) {
    document.getElementsByClassName('game-word')[0].innerText = 'You lose Loser';
  } else if ((incorrect_num<7) && (correct_num==secret_word.length - 1)) {
    document.getElementsByClassName('game-word')[0].innerText = 'You won Winner! ' + secret_word;
  } else if (secret_word.indexOf(guess_letter) !== -1){
    correct_letters.push(guess_letter);
    document.getElementsByClassName('game-word')[0].innerText = 'You have ' + (secret_word.length - correct_num) + ' letters left';
    correct_num = correct_num + 1;
    guessed_num = guessed_num + 1;
    document.querySelector('figure span').innerText = 'Guesses Left: ' + (8 - incorrect_num);
    // document.querySelector('aside div span').innerText = 'Letters Guessed Already: ' + guessed_num;
    document.getElementById('letter').value = "";
    document.querySelector('aside div span').innerText = 'Letters Guessed Already: ' + guess_letters.join(', ');
    debugger

  } else {
    document.getElementsByClassName('game-word')[0].innerText = 'You have ' + (secret_word.length - correct_num) + ' letters left';
    incorrect_num = incorrect_num + 1;
    guessed_num = guessed_num + 1;
    document.querySelector('figure span').innerText = 'Guesses Left: ' + (8 - incorrect_num);
    // document.querySelector('aside div span').innerText = 'Letters Guessed Already: ' + guessed_num;
    document.getElementById('letter').value = "";
    document.querySelector('aside div span').innerText = 'Letters Guessed Already: ' + guess_letters.join(', ');
  };
  });

  give_up.addEventListener('click', function(){

    correct_num = 0;
    guessed_num = 0;
    guess_letters = [];
    incorrect_num = 0;
    document.querySelector('figure span').innerText = 'Guesses Left: ' + 8;
    document.getElementsByClassName('game-word')[0].innerText = 'You gave up!';
    // document.querySelector('aside div span').innerText = 'Letters Guessed Already: '
  });

  new_game.addEventListener('click', function(){

    correct_num = 0;
    guessed_num = 0;
    guess_letters = [];
    incorrect_num = 0;
    document.getElementsByClassName('game-word')[0].innerText = 'Restart!';
    document.querySelector('aside div span').innerText = 'Letters Guessed Already: '
  });
};









