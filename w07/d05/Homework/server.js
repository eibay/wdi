// // console.log('Whats secret word?');

// // var secret_word = return;

// var readline = require('readline');

// var rl = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// rl.question('Whats secret word?', function(answer) {

// var secret_word = answer;
// console.log('The number of letter is ' + secret_word.length);
// return secret_word;

// });

// var correct_num = 0;
// var incorrect_num = 0;

// while (incorrect_num<8 && correct_num<secret_word.length) {

// rl.question('Whats your first guess?', function(user_input) {

// var user_input = user_input;
// return user_input;

// rl.close();

// });

// if (secret_word.indexOf(user_input) !== -1) {
// console.log('That letter is in the word.')
// correct_num = correct_num + 1;
// } else {
// console.log('incorrect');
// incorrect_num = incorrect_num - 1;
// };

// };

// console.log('You lose Loser...'); 




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
    if (incorrect_num>7) {//we need some base case, for recursion
      log('You lose Loser');
      return rl.close();
    } else if ((incorrect_num<7) && (correct_num==secret_word.length)) {
      log('You won Winner');
      return rl.close(); //closing RL and returning from function.
    } else if (secret_word.indexOf(answer) !== -1){  
      log('Got it! Your answer was: "', answer, '"');
      correct_num = correct_num + 1;
      recursiveAsyncReadLine();
    } else {
      log('The letter didnt match')
      incorrect_num = incorrect_num + 1;
      recursiveAsyncReadLine();
    }
    recursiveAsyncReadLine(); //Calling this function again to ask new question
  });
};

recursiveAsyncReadLine();