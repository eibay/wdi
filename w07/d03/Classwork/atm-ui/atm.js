var action = "deposit"
var amount = 1100
var accountType = "checking"
var balance = 1000
var savingsBalance = 1000

if (action == "deposit") {
  if (accountType == "checking"){
  balance = amount + balance;
  finishTransaction(savingsBalance, balance);
  } else {
  savingsBalance = amount + savingsBalance
  }

} else if (action == "withdraw" && accountType == "savings") {

  if (amount > savingsBalance) {
    console.log("Insufficient funds");
  } else {
    savingsBalance = savingsBalance - amount;  
    finishTransaction(savingsBalance, balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance) {
    // can savings cover it?
    
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;
      
      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(savingsBalance, balance);
      
    } else {
      console.log('Insufficient funds')
    };
  }else if (amount < balance) {
    balance = balance-amount;
    finishTransaction(balance)
  }
  

} else {
  console.log("Invalid action");
}

function finishTransaction(savingsBalance, balance) {
  console.log("You have $" + balance + " in your account checking");
  console.log("You have $" + savingsBalance + " in your account savings");
}