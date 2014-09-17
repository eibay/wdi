var fs = require('fs');

var action = process.argv[2];
var amount = parseInt(process.argv[3]);
var accountType = process.argv[4];
var balance = parseInt(fs.readFileSync('./' + accountType + '.txt'));

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw") {

  if (amount > balance) {
    console.log("Insufficient funds");
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You have $" + balance + " in your account");
}