var fs = require('fs');

var action = "deposit";
var amount = parseInt(200);
var accountType = "savings";
var balance = parseInt(1000);

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} 
else if (action == "withdraw" && accountType == "savings") {

  if (amount > balance) {
    console.log("Insufficient funds");
  } 
  else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} 
else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance) {
    // can savings cover it?
    var savingsBalance = parseInt(300);
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);
      
    } 
    else {
      console.log('Insufficient funds');
    }
  }
} 
else {
  console.log("Invalid action");

}

function finishTransaction(balance) {
  return balance;
  console.log("You have $" + balance + " in your account");
}