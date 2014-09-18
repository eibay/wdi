window.onload = function() {
  
function getCurrentChecking() {
  
}



document.getElementsByClassName('deposit').addEventListener('click', function(){


})

var amount = document.createElement('input');


var deposit = document.createElement('button');


var withdraw = document.createElement('button');

// ParseInt = .to_i


function getCurrentSavings() {
  
}

function finishTransaction(balance) {
  
}


var action = "withdraw";
var accountType = "checking";
var amount = 1200;
var balance

if (accountType == "checking") {
  balance = getCurrentChecking();
 
} else {
  balance = getCurrentSavings();
  
}

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw" && accountType == "savings") {

  if (amount > balance) {
    
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > balance) {
    // can savings cover it?
    var savingsBalance = getCurrentSavings();
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      
      balance = 0;

      finishTransaction(balance);
    
    
  } else {
    balance = balance - amount;
    finishTransaction(balance);
  }


