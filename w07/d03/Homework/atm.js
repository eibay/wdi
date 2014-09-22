var deposit_action = document.getElementsByClassName("deposit")
var withdraw_action = document.getElementsByClassName("withdraw")
var accountTypeChecking = document.getElementsByTagName("h2")[0].innerText;
var accountTypeSavings = document.getElementsByTagName("h2")[1].innerText;
var amount = document.getElementsByName("amount");

var balance; 
var savings_balance = document.getElementsByClassName("balance")[1].innerText
savings_balance = parseInt(savings_balance.split("$")[1]);

var checking_balance = document.getElementsByClassName("balance")[0].innerText
checking_balance = parseInt(checking_balance.split("$")[1]);



if (accountTypeChecking == "Checking") {
  balance = getCurrentChecking();
  console.log("balance starting out at " + balance)
} else {
  balance = getCurrentSavings();
  console.log("balance starting out at " + balance)
}

var deposit_button = document.getElementsByClassName("account checking")[0].children[3]
deposit_button.addEventListener("click", function(event){
  var checking_total_balance = parseInt(amount[0].value) + checking_balance;
  var current_balance_tag = document.getElementsByClassName("balance")[0]
  var new_balance = document.createElement("div")
  new_balance.className = "balance"
  new_balance.innerText = checking_total_balance
  current_balance_tag.parentElement.appendChild(new_balance)
  current_balance_tag.parentElement.removeChild(current_balance_tag)
  console.log( + checking_total_balance);
});


var withdraw_button = document.getElementsByClassName("account savings")[0].children[4]
withdraw_button.addEventListener("click", function(event){
    if (parseInt(amount[1].value) > balance) {
    console.log("Insufficient funds");
  } else{
    balance = balance - parseInt(amount[1].value);  
    finishTransaction(balance);
  }
});


var withdraw_button = document.getElementsByClassName("account checking")[0].children[4]
withdraw_button.addEventListener("click", function(event){
  if (withdraw_action[0].innerText == "Withdraw" && accountTypeChecking == "Checking"){
   if (parseInt(amount[0].value) > balance) {
    // can savings cover it?
    var savingsBalance = getCurrentSavings();
  }else if (parseInt(amount[0].value) <= balance + savingsBalance) {
      var overdraftAmount = parseInt(amount[0].value) - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      console.log('your savings balance is now ' + savingsBalance)
      balance = 0;

      finishTransaction(balance);
    } else {
        console.log('Insufficient funds');
    }
  }
});

} else {
    balance = balance - amount;
    finishTransaction(balance);
  }
} else {
  console.log("Invalid action");
}

function getCurrentChecking() {
  var currentBalance = document.getElementsByClassName("balance")[0].innerText
  currentBalance = parseInt(currentBalance.split("$")[1])
  return currentBalance;
}

function getCurrentSavings() {
   var currentBalance = document.getElementsByClassName("balance")[1].innerText
   currentBalance = parseInt(currentBalance.split("$")[1])
   return currentBalance
}

function finishTransaction(balance) {
  console.log("You now have $" + balance + " in your " + accountTypeChecking + " account");
}