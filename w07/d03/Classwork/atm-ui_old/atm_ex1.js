
var action = "withdraw";
var amount = 100;
var accountType = "checking";
var balance = 1000;
var savingsBalance = 1000;

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw" && accountType == "savings") {
  console.log('trying to withdraw from savings')
  if (amount > balance) {
    console.log("Insufficient funds");
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  console.log('trying to withdraw from checking')
    if (amount > balance) {
        console.log('amount to withdraw is greater than balance')
        // can savings cover it?
        var savingsBalance = savingsBalance;
        if (amount <= balance + savingsBalance) {
          var overdraftAmount = amount - balance;

          savingsBalance = savingsBalance - overdraftAmount;
          balance = 0;

          finishTransaction(balance);
        }} else {
          console.log('Insufficient funds');
      
    } else if (amount < balance) { 
        balance = balance - amount
    } else {
      console.log("Invalid action");
    }
  }
}

function finishTransaction(balance) {
  console.log("You have $" + balance + " in your account");
}