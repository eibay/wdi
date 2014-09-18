// We gotta figure out the arguments, get two words

var fs = require('fs');

var commands = process.argv
var savings = Number(fs.readFileSync('./saving.txt'))
var checking = Number(fs.readFileSync('./checking.txt'))
var amount = Number(commands[3]);
var action = commands[2];
var account = commands[4];

if (action == "deposit" && account == "checking") {
  var newBalance = checking + amount;
  fs.writeFile('./checking.txt', newBalance)
 finishCheckingTransaction(checking);

} else if (action == "withdraw" && account == "checking") {

  if (amount > newBalance) {
      var savings = parseInt(fs.readFileSync('./saving.txt'))
      if (amount <= newBalance + savings) {
        var overdraftAmount = amount - newBalance;

        savings = savings - overdraftAmount;
        balance = 0;

        finishCheckingTransaction(newBalance)
        fs.writeFileSync('./savings.txt', savingsBalance);
      } else {
        console.log("insufficient funds")
      }

      }
  }

  var newBalance = checking - amount;
  fs.writeFile('./balance.txt', newBalance)
  finishCheckingTransaction(checking);

} else if (action == "deposit" && account == "savings") {
  var newBalance = savings + amount
   fs.writeFile('./saving.txt', newBalance)
    finishSavingsTransaction(savings);

} else if (action == "withdraw" && account == "savings") {
  var newBalance = savings - amount;
  fs.writeFile('./saving.txt', newBalance)
  finishSavingsTransaction(savings);

}


// } else if (action == "withdraw" && account == "checking" && balance < amount) {
//   console.log("insufficient funds");


  function finishSavingsTransaction (checkingbalance) {
    console.log("You have " + newBalance +  " in your savings account ");

 }


  function finishCheckingTransaction (savingsbalance) {
    console.log("You have " + newBalance +  " in your checking account ");

 }



