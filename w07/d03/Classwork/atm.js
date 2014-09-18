var action = "withdraw"
var amount = 2000;
var accountType = "checking";
var balance_checking = 1000;
var balance_savings = 1000;

if (action == "deposit") {
  balance = amount + balance_checking;
  finishTransaction(balance);

} else if (action == "withdraw" && accountType == "savings") {

  if (amount > balance_savings) {
    console.log("Insufficient funds");
  } else {
    balance = balance_savings - amount;  
    finishTransaction(balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance_checking) {
    // can savings cover it?
    var savingsBalance = balance_savings;
    if (amount <= balance_checking + savingsBalance) {
      var overdraftAmount = amount - balance_checking;

      savingsBalance = savingsBalance - overdraftAmount;
      balance_checking = 0;

      finishTransaction(balance_checking);
      balance = savingsBalance;
    } else {
      console.log('Insufficient funds');
    }
  } else {
    balance = balance_checking - amount;
    finishTransaction(balance);
  }
} else {
  console.log("Invalid action");
}

function finishTransaction(bal) {
  debugger
  balance = bal;
  console.log("You have $" + bal + " in your account");
}



var balance = document.querySelectorAll("div.balance")

var checking_balance = balance[0].textContext
var balance_savings = balance[1].textContext