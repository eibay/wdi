// var fs = require('fs');

// var action = process.argv[2];
// var amount = parseInt(process.argv[3]);
// var accountType = process.argv[4];
// var balance = parseInt(fs.readFileSync('./' + accountType + '.txt'));

// var action = "withdraw";
// var amount = 1000;
// var accountType = "checking";
var checking = document.querySelector("div.account.checking");
var checking_amt = checking.querySelector("input");
var savings = document.querySelector("div.account.savings");
var savings_amt = savings.querySelector("input");
var check_deposit = checking.querySelector("button.deposit");
var check_withdraw = checking.querySelector("button.withdraw");
var check_window = checking.querySelector("div.balance");
var check_savings_window = savings.querySelector("div.balance");
var check_savings_deposit = savings.querySelector("button.deposit");
var check_savings_withdraw = savings.querySelector("button.withdraw");

var depositTransaction = function(){
  var current_checking = check_window.innerText.slice(1);
  var total = (parseInt(checking_amt.value) + parseInt(current_checking));
  check_window.innerText = "$" + total.toString();
  checking_amt.value = '';
}

var withdrawTransaction = function(){
  var current_checking = check_window.innerText.slice(1);
  var total = (parseInt(current_checking) - parseInt(checking_amt.value)) ;
  check_window.innerText = "$" + total.toString();
  checking_amt.value = '';
}

var depositSavingsTransaction = function(){
  var current_savings = check_savings_window.innerText.slice(1);
  var total = (parseInt(savings_amt.value) + parseInt(current_savings));
  check_savings_window.innerText = "$" + total.toString();
  savings_amt.value = '';
}

var withdrawSavingsTransaction = function(){
  var current_savings = check_savings_window.innerText.slice(1);
  var total = (parseInt(current_savings) - parseInt(savings_amt.value)) ;
  check_savings_window.innerText = "$" + total.toString();
  savings_amt.value = '';
}

  check_deposit.addEventListener("click", depositTransaction)
  check_withdraw.addEventListener("click", withdrawTransaction)
  check_savings_deposit.addEventListener("click", depositSavingsTransaction);
  check_savings_withdraw.addEventListener("click", withdrawSavingsTransaction);
// } else if (action == "deposit" && accountType == "savings"){
//   savingsBalance = amount + savingsBalance;
//   finishTransaction(savingsBalance);
// // } else if (action == "withdraw" && accountType == "savings") {
//
//   // if (amount > savingsBalance) {
//     console.log("Insufficient funds");
//   // } else {
//     savingsBalance = savingsBalance - amount;
//     finishTransaction(savingsBalance);
//   // }
//
// // } else if (action == "withdraw" && accountType == "checking") {
//   console.log(amount);
//   console.log(balance);
//   console.log(savingsBalance);
//   // if (amount > balance) {
//
//     // if (amount <= balance + savingsBalance) {
//       var overdraftAmount = amount - balance;
//       console.log(overdraftAmount);
//       savingsBalance = savingsBalance - overdraftAmount;
//       console.log("#" + savingsBalance);
//       finishTransaction(savingsBalance);
//       balance = 0;
//
//       finishTransaction(balance);
//       // fs.writeFileSync('./savings.txt', savingsBalance);
//     // } else {
//       console.log('Insufficient funds');
//   //   }
//   // }
//   balance = balance - amount;
//   // if (amount < balance){
//     finishTransaction(balance);
//   // }
// // } else {
//   console.log("Invalid action");
// // }
//
// function finishTransaction(balance) {
//   // fs.writeFileSync('./' + accountType + '.txt', balance);
//   console.log("You have $" + balance + " in your account");
// }








// var fs = require('fs');
//
// var action = process.argv[2];
// var amount = parseInt(process.argv[3]);
// var balance = parseInt(fs.readFileSync('./balance.txt'));
// var savings_balance = parseInt(fs.readFileSync('./savings.txt'));
// var account = process.argv[4];
//
// if (action == "deposit") {
//
//   if (account == "checking"){
//     balance = amount + balance;
//     finishTransaction(balance);
//   } else if (account == "savings"){
//     savings_balance = amount + savings_balance;
//     finishSavingsTransaction(savings_balance);
//   }
//
//
// } else if (action == "withdraw") {
//
//   if (amount > balance) {
//     console.log("Insufficient funds");
//     savings_balance = savings_balance - balance;
//     finishSavingsTransaction(savings_balance);
//     balance = balance - balance
//     finishTransaction(balance);
//
//   } else {
//     balance = balance - amount;
//     finishTransaction(balance);
//   }
//
// } else {
//   console.log("Invalid action");
// }
//
// function finishTransaction(balance) {
//   fs.writeFileSync('./balance.txt', balance);
//   console.log("You have $" + balance + " in your account");
// }
//
// function finishSavingsTransaction(balance){
//   fs.writeFileSync('./savings.txt', savings_balance);
//   console.log("You have $" + savings_balance + " in your savings account.");
// }
//
//
//
//
//
//
//
//
//
//
//
// // var fs = require('fs');
// //
// // var inputs = process.argv;
// // var monetary_amt = inputs[3];
// //
// // if (inputs[2] == "deposit"){
// //   var file = JSON.parse(fs.readFileSync('./monies.txt').toString());
// //   console.log(file);
// //   console.log(typeof(file));
// //   var result = file.push(monetary_amt);
// //   result = result.to_json;
// //   console.log(file);
// //   file.writeFileSync('./monies.txt', result);
// //   // // fs.appendFileSync('./monies.txt', inputs[3]);
// // } else if (inputs[2] == "withdraw"){
// //   var monies  = fs.readFileSync('./monies.txt').toString();
// //
// // }
