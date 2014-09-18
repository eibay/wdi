if (document.querySelector('button').className == "deposit") {
  var action = "deposit";
  var amount = document.querySelector('button').parentNode.querySelector('input').value;
} else {
  var action = "withdraw";
}
var amount = document.get
var accountType = "checking";
var balance = document.get;

var balance;

if (accountType == "checking") {
  balance = getCurrentChecking();
  console.log("balance starting out at " + balance)
} else {
  balance = getCurrentSavings();
  console.log("balance starting out at " + balance)
}

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
    var savingsBalance = getCurrentSavings();
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      console.log('your savings balance is now ' + savingsBalance)
      balance = 0;

      finishTransaction(balance);
    } else {
      console.log('Insufficient funds');
    }
  } else {
    balance = balance - amount;
    finishTransaction(balance);
  }
} else {
  console.log("Invalid action");
}

function getCurrentChecking() {
  //for now
  return 1000;
}

function getCurrentSavings() {
  //for now
  return 5000;  
}

function finishTransaction(balance) {
  //fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You now have $" + balance + " in your " + accountType + " account");
}