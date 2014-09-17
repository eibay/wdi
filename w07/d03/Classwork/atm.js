var fs = require('fs');

var action = process.argv[2];
var amount = parseInt(process.argv[3]);
var accountType = process.argv[4];
var balance = parseInt(fs.readFileSync('./' + accountType + '.txt'));

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
    var savingsBalance = parseInt(fs.readFileSync('./savings.txt'));
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);
      fs.writeFileSync('./savings.txt', savingsBalance);
    } else {
      console.log('Insufficient funds');
    }
  }
} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You have $" + balance + " in your account");
}








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
