// var fs = require('fs'); //change this: brwoser cannot

// var action = "withdraw" //=> replaced by button
// var amount = 1000 //=> replaced by input
// var accountType = "checking" //=> replaced by parentNode
// var balance = 0 //=> replaced by balance

// variables
var div_acct_C = document.getElementById("balanceChecking")
  var bal_C = div_acct_C.children[1]
 
  var btn_dep_C = div_acct_C.children[3]
  var btn_wth_C = div_acct_C.children[4]


var div_acct_S = document.getElementById("balanceSaving")
  var bal_S = div_acct_S.children[1]
  var amount_S = div_acct_S.children[2]
  var btn_dep_S = div_acct_S.children[3]
  var btn_wth_S = div_acct_S.children[4]

// var balance = document.getElementsByClassName("balance")
// var amount = document.getElementsByClassName("amount")
// var btn_dep = document.getElementsByClassName("deposit")
// var btn_wth = document.getElementsByClassName("withdraw")
// after this, can check to see if Checking or Saving by looking at parentNode == div_acct_C or div_acct_S

//logic


////////////////////////////////////////////////////////////////////////
////////////////////////   Deposit Button   ////////////////////////////
////////////////////////////////////////////////////////////////////////
// button - deposit --- this includes the account numbers
/// checking

btn_dep_C.addEventListener('click', function(event){
  var balance = div_acct_C.children[1].innerText // read balance
            console.log("previous balance: " + Number(balance))
  var amount = div_acct_C.children[2].value //read value
            console.log("depositing: " + amount)

  div_acct_C.children[1].innerText = Number(balance) + Number(amount)// why do i need this in addition to below?
  balance = div_acct_C.children[1].innerText //update value
            console.log("new balance: " + balance)
})


/// savings
btn_dep_S.addEventListener('click', function(event){
  var balance = div_acct_S.children[1].innerText // read balance
            console.log("previous balance: " + Number(balance))
  var amount = div_acct_S.children[2].value //read value
            console.log("depositing: " + amount)

  div_acct_S.children[1].innerText = Number(balance) + Number(amount)// why do i need this in addition to below?
  balance = div_acct_C.children[1].innerText //update value
            console.log("new balance: " + balance)
})

////////////////////////////////////////////////////////////////////////
////////////////////////   Withdrawal Button   /////////////////////////
////////////////////////////////////////////////////////////////////////
btn_wth_C.addEventListener('click', function(event){
   var balance = div_acct_C.children[1].innerText // read balance
            console.log("previous balance: " + Number(balance))
   var amount = div_acct_C.children[2].value //read value
            console.log("withdrawing: " + amount)         


})

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
//     var savingsBalance = 1000
//     if (amount <= balance + savingsBalance) {
//       var overdraftAmount = amount - balance;

//       savingsBalance = savingsBalance - overdraftAmount;
//       balance = 0;

//       finishTransaction(balance);
//     } else {
//       console.log('Insufficient funds');
//     }
//   }
// } else {
//   balance = balance - amount;
//   finishTransaction(balance);
// }

// function finishTransaction(balance) {
//   console.log("You have $" + balance + " in your account");
// }