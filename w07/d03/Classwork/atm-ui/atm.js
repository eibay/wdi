// var fs = require('fs');

var action = 
// process.argv[2];
var amount = parseInt();
var accountType = 
// process.argv[4];
var balance = 
// parseInt(fs.readFileSync('./' + accountType + '.txt'));

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw" && accountType == "savings") {

  if (amount > balance) {
    console.log("Insufficient funds");
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance) {
    // can savings cover it?
    var savingsBalance = parseInt();
    // fs.readFileSync('./savings.txt')
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);
      // fs.writeFileSync('./savings.txt', savingsBalance);
    } else {
      console.log('Insufficient funds');
    }
  }
} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  // fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You have $" + balance + " in your account");
}