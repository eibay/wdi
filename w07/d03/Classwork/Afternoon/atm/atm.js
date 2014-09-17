// var fs = require('fs'); //change this: brwoser cannot

// var action = "withdraw" //=> replaced by button
// var amount = 1000 //=> replaced by input
// var accountType = "checking" //=> replaced by parentNode
// var balance = 0 //=> replaced by balance

// variables
var div_acct_C = document.getElementById("balanceChecking")
  var btn_dep_C = div_acct_C.children[3]
  var btn_wth_C = div_acct_C.children[4]


var div_acct_S = document.getElementById("balanceSaving")
  var btn_dep_S = div_acct_S.children[3]
  var btn_wth_S = div_acct_S.children[4]


btn_dep_C.addEventListener('click', function(event){
  var balance = div_acct_C.children[1].innerText // read balance
            console.log("Starting checking balance: " + Number(balance))
  var amount = div_acct_C.children[2].value //read value
            console.log("Depositing: " + amount)

  div_acct_C.children[1].innerText = Number(balance) + Number(amount)// why do i need this in addition to below?
  balance = div_acct_C.children[1].innerText //update value
            console.log("New checking balance: " + balance)
})


/// savings
btn_dep_S.addEventListener('click', function(event){

  var balance = div_acct_S.children[1].innerText // read balance
            console.log("Starting savings balance: " + Number(balance))
  var amount = div_acct_S.children[2].value //read value
            console.log("Depositing: " + amount)

  div_acct_S.children[1].innerText = Number(balance) + Number(amount)// why do i need this in addition to below?
  balance = div_acct_S.children[1].innerText //update value
            console.log("New savings balance: " + balance)
})

////////////////////////////////////////////////////////////////////////
////////////////////////   Withdrawal Button   /////////////////////////
////////////////////////////////////////////////////////////////////////
btn_wth_C.addEventListener('click', function(event){
  var balance = div_acct_C.children[1].innerText // read balance
            console.log("Starting checking balance: " + Number(balance))
  var balanceSaving = div_acct_S.children[1].innerText // read balance
            console.log("Starting savings balance: " + Number(balance))

  var amount = div_acct_C.children[2].value //read value
            console.log("withdrawal request: " + amount)  

  var withdrawSavings = Number(amount) - Number(balance)
            console.log("total amount: " + withdrawSavings)

  //if they try to withdraw too much
  if(Number(balance)>=Number(amount)){
    div_acct_C.children[1].innerText = Number(balance) - Number(amount)
    balance = div_acct_C.children[1].innerText //update value
            console.log("New checking balance: " + balance)
  } else if( ( Number(balance) + Number(balanceSaving) ) > Number(amount) ){

    console.log("overdraft")

    // balanceSaving
    div_acct_S.children[1].innerText = div_acct_S.children[1].innerText - Number(amount) + Number(balance)

    // balance = 0
    div_acct_C.children[1].innerText = "0"



  } else {
    alert("Error. We require more Vespene gas.")
  }
 
})


btn_wth_S.addEventListener('click', function(event){
  var balance = div_acct_S.children[1].innerText // read balance
            console.log("Starting saving balance: " + Number(balance))
  var balanceChecking = div_acct_C.children[1].innerText // read balance
            console.log("Starting checking balance: " + Number(balance))
  var amount = div_acct_S.children[2].value //read value
            console.log("withdrawal request: " + amount)

  //if they try to withdraw too much
  if(Number(balance)>=Number(amount)){
    div_acct_S.children[1].innerText = Number(balance) - Number(amount)
    balance = div_acct_S.children[1].innerText //update value
            console.log("New savingbalance: " + balance)
  } else {
    alert("Error. We require more Vespene gas.")
  }
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