var action = "withdraw";
var amount = 2200;
var accountType = "checking";
var balance = 1000;
var savingsBalance = 1000;

if (action == "deposit") {
  balance = amount + balance;
  finishTransaction(balance);
}

 else if (action == "withdraw" && accountType == "savings") {
  
  if (amount > savingsBalance) {
    console.log("Insufficient funds");
  } else {
    savingsBalance = savingsBalance - amount;  
    finishTransaction(savingsBalance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance) {
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);}
    else {
      console.log('Insufficient funds');
    }
  } else if (amount < balance) {
      balance = balance - amount
      finishTransaction(balance)
  } 
} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  console.log("You have $" + balance + " in your account")
}


