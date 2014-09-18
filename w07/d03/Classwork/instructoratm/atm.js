var action = "deposit"
var amount = 1000
var accountType = "checking"
var balance = 500

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
    var savingsBalance = 100
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);
      // fs.writeFileSync('./savings.txt', savingsBalance);
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

function finishTransaction(balance) {
  // fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You have $" + balance + " in your account");
}