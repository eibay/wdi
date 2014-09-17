// We gotta figure out the arguments, get two words

var fs = require('fs');

var commands = process.argv
var balance = Number(fs.readFileSync('./balance.txt'))
var amount = Number(commands[3]);
var action = commands[2];

if (action == "deposit") {
  var newBalance = balance + amount;
  fs.writeFile('./balance.txt', newBalance)
 finishTransaction(balance);


} else if (action == "withdraw" && balance < amount) {
  console.log("insufficient funds");


} else if (action == "withdraw") {
  var newBalance = balance - amount;
  fs.writeFile('./balance.txt', newBalance)
  finishTransaction(balance);
}

  function finishTransaction (balance) {
    console.log("You have " + newBalance +  " in your account ");
 }