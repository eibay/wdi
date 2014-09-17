var fs = require('fs');

var action = process.argv[2];
var amount = parseInt(process.argv[3]);
var account = process.argv[4]
var balance = parseInt(fs.readFileSync('./'+account+'.txt'));

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw") {

  if (amount > balance && account == "saving") {
    console.log("Insufficient funds");
  }else if (amount > balance && account == "checking"){
    savingsbalance = parseInt(fs.readFileSync('./saving.txt'))
    over = balance - amount
    fromsavings = savingsbalance + over
    if (fromsavings < 0){
      console.log("Insufficient funds")
    }else{
    console.log(fromsavings + " saving balance" + " " + 0 + " checking balance")
    fs.writeFileSync('./checking.txt', 0);
    fs.writeFileSync('./saving.txt', fromsavings);
  }
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  fs.writeFileSync('./'+account+'.txt', balance);
  console.log("You have $" + balance + " in your account");
}