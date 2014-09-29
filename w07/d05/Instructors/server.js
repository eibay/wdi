var readline = require('readline');
var log = console.log;

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var secret_word = 'hamster';
console.log('The number of letter is ' + secret_word.length);

var correct_num = 0;
var incorrect_num = 0;

var recursiveAsyncReadLine = function () {
  rl.question('Whats your guess?', function (answer) {
    if (incorrect_num>7) {
      log('You lose Loser');
      return rl.close();
    } else if ((incorrect_num<7) && (correct_num==secret_word.length - 1)) {
      log('You won Winner');
      return rl.close();
    } else if (secret_word.indexOf(answer) !== -1){  
      log('Got it! Your answer was: "', answer, '"');
      correct_num = correct_num + 1;
      recursiveAsyncReadLine();
    } else {
      log('The letter didnt match')
      incorrect_num = incorrect_num + 1;
      recursiveAsyncReadLine();
    }
    recursiveAsyncReadLine();
  });
};

recursiveAsyncReadLine();