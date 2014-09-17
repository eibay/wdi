var checking = document.querySelector("article").children[1];
var savings = document.querySelector("article").children[2];
var viewChecking = document.querySelector("article").children[1].children[1];
var viewSavings = document.querySelector("article").children[2].children[1];




// if (accountType == 'checking') {
//   balance = getCurrentChecking();
//   console.log("balance starting out at " + balance)
// } else {
//   balance = getCurrentSavings();
//   console.log("balance starting out at " + balance)
// }

// if (action == "deposit") {

//   balance = amount + balance;
//   finishTransaction(balance);

// } else if (action == "withdraw" && accountType == "savings") {

//   if (amount > balance) {
//     console.log("Insufficient funds");
//   } else {
//     balance = balance - amount;  
//     finishTransaction(balance);
//   }

// } else if (action == "withdraw" && accountType == "checking") {
//   if (amount > balance) {
//     // can savings cover it?
//     var savingsBalance = getCurrentSavings();
//     if (amount <= balance + savingsBalance) {
//       var overdraftAmount = amount - balance;

//       savingsBalance = savingsBalance - overdraftAmount;
//       console.log('your savings balance is now ' + savingsBalance)
//       balance = 0;

//       finishTransaction(balance);
//     } else {
//       console.log('Insufficient funds');
//     }
//   } else {
//     balance = balance - amount;
//     finishTransaction(balance);
//   }
// } else {
//   console.log("Invalid action");
// }

function getCurrentChecking() {
  //for now
  return checkingBalance;
}

function getCurrentSavings() {
  //for now
  return savingsBalance;  
}

function finishTransaction(balance) {
  //fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You now have $" + balance + " in your " + accountType + " account");
}