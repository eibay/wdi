var action = "withdraw";
var accountType = "checking";
var amount = 1200;
var checkingBalance = 0;
var savingsBalance = 0;

// this could just display the balance on the page
if (accountType == "checking") {
  balance = getCurrentChecking();
  console.log("balance starting out at " + checkingBalance)
} 
else {
  balance = getCurrentSavings();
  console.log("balance starting out at " + savingsBalance)
}

// checking deposit
if ((action == "deposit") && (accountType == "checking")) {
  depositChecking(amount);
  finishCheckingTransaction(checkingBalance);
} 
// savings deposit
else if ((action == "deposit") && (accountType == "savings")) {
  depositSavings(amount);
  finishSavingsTransaction(savingsBalance);
} 
// savings withdrawal
else if ((action == "withdraw") && (accountType == "savings")) {
  withdrawSavings(amount);
  finishSavingsTransaction(savingsBalance);
} 
// checking withdrawal
else if ((action == "withdraw") && (accountType == "checking")) {
  if (amount > checkingBalance) {
    // can savings cover it?
    if (amount <= checkingBalance + savingsBalance) {
      var overdraftAmount = amount - checkingBalance;

      savingsBalance = savingsBalance - overdraftAmount;
      console.log('your savings balance is now ' + savingsBalance)
      checkingBalance = 0;

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

function depositChecking(amount) {
  checkingBalance = checkingBalance + amount;
  return checkingBalance;
}

function withdrawChecking(amount) {
  checkingBalance = checkingBalance - amount;
  return checkingBalance;
}

function depositSavings(amount) {
  savingsBalance = savingsBalance + amount;
  return savingsBalance;
}

function withdrawSavings(amount) {
  savingsBalance = savingsBalance - amount;
  return savingsBalance;
}

function getCurrentChecking(checkingBalance) {
  return checkingBalance;
}

function getCurrentSavings(savingsBalance) {
  return savingsBalance;  
}

function finishCheckingTransaction(checkingBalance) {
  console.log("You now have $" + checkingBalance + " in your " + accountType + " account");
}
function finishSavingsTransaction(savingsBalance) {
  console.log("You now have $" + savingsBalance + " in your " + accountType + " account");
}
