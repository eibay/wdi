
var buttons = document.querySelectorAll("button");

var deposit_checking = buttons[0]
var withdraw_checking = buttons[1]
var deposit_savings = buttons[2]
var withdraw_savings = buttons[3]

var deposit = function(number) {
  var amount = parseInt(document.querySelectorAll("input")[number].value);
  var old_balance = document.getElementsByClassName("balance")[number].innerText;
  old_balance = parseInt(old_balance.substring(1, old_balance.length));
  var new_balance = old_balance + amount;
  var balance_display = document.getElementsByClassName("balance")[number];
  balance_display.innerText = "$" + new_balance;
};

var withdraw = function(number)  {
  var amount = parseInt(document.querySelectorAll("input")[number].value);
  var old_balance = document.getElementsByClassName("balance")[number].innerText;
  old_balance = parseInt(old_balance.substring(1, old_balance.length));
  var new_balance = old_balance - amount;
  var balance_display = document.getElementsByClassName("balance")[number];
  balance_display.innerText = "$" + new_balance;
};

deposit_checking.addEventListener("click", function() {
  deposit(0);
})
deposit_savings.addEventListener("click", function(){
  deposit(1);
})

withdraw_checking.addEventListener("click", function() {
  withdraw(0);
})

withdraw_savings.addEventListener("click", function(){
  withdraw(1);
})

// withdraw_checking.

//   button.addEventListener("click", function (){
//     if (button.className == "deposit") {
//       if (button.parentNode.className == "account checking"){
//           var amount = parseInt(document.querySelectorAll("input")[0].value);
//           var old_balance = document.getElementsByClassName("balance")[0].innerText;
//           old_balance = parseInt(old_balance.substring(1, old_balance.length));
//           var new_balance = old_balance + amount;
//           var balance_display = document.getElementsByClassName("balance")[0];
//           balance_display.innerText = new_balance;
//       } else if (button.parentNode.className == "account savings"){
//           var amount = parseInt(document.querySelectorAll("input")[1].value);
//           var old_balance = document.getElementsByClassName("balance")[1].innerText;
//           old_balance = parseInt(old_balance.substring(1, old_balance.length));
//           var new_balance = old_balance + amount;
//           balance_display.innerText = new_balance;
//       };
//   } else if (button.className == "withdraw"){
//       if (button.parentNode.className == "account checking"){
//           var amount = parseInt(document.querySelectorAll("input")[0].value);
//           var old_balance = document.getElementsByClassName("balance")[0].innerText;
//           old_balance = parseInt(old_balance.substring(1, old_balance.length));
//           var new_balance = old_balance - amount;
//           var balance_display = document.getElementsByClassName("balance")[0];
//           balance_display.innerText = new_balance;
//       } else {
//           var amount = parseInt(document.querySelectorAll("input")[1].value);
//           var old_balance = document.getElementsByClassName("balance")[1].innerText;
//           old_balance = parseInt(old_balance.substring(1, old_balance.length));
//           var new_balance = old_balance - amount;
//           var balance_display = document.getElementsByClassName("balance")[1];
//           balance_display.innerText = new_balance;
//       };
//     }
//   })


// if (accountType == "checking") {
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

// function getCurrentChecking() {
//   balance = document.getElementsByClassName("balance")[0].innerText
//   balance = parseInt(balance.substring(1, balance.length))
//   return balance;
// }

// function getCurrentSavings() {
//   balance = document.getElementsByClassName("balance")[1].innerText
//   balance = parseInt(balance.substring(1, balance.length))
//   return balance;
// }

// function finishTransaction(balance) {
//   console.log("You now have $" + balance + " in your " + accountType + " account");
// }